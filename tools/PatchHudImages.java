import java.io.*;
import java.nio.file.*;
import java.util.*;
import javax.imageio.ImageIO;
import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.tags.base.*;
import com.jpexs.decompiler.flash.types.*;
import com.jpexs.decompiler.flash.types.shaperecords.StyleChangeRecord;
public class PatchHudImages {
 static Map<Integer,double[]> ratios=new HashMap<>();
 static Set<FILLSTYLE> seen=Collections.newSetFromMap(new IdentityHashMap<>());
 static int fills=0;
 static boolean patch(FILLSTYLE f){
  if(f==null || !f.hasBitmap() || !ratios.containsKey(f.bitmapId) || !seen.add(f))return false;
  var r=ratios.get(f.bitmapId);var m=f.bitmapMatrix;
  float a=m.hasScale?m.scaleX:1,b=m.hasScale?m.scaleY:1;
  // Contain the wider replacement logo in the original slot without distortion.
  if(r.length>2){
   m.translateX+=(int)Math.round(a*r[2]+m.rotateSkew1*r[3]);
   m.translateY+=(int)Math.round(m.rotateSkew0*r[2]+b*r[3]);
  }
  m.hasScale=true;m.scaleX=(float)(a*r[0]);m.scaleY=(float)(b*r[1]);
  m.rotateSkew0*=r[0];m.rotateSkew1*=r[1];
  if(f.fillStyleType==FILLSTYLE.NON_SMOOTHED_CLIPPED_BITMAP)f.fillStyleType=FILLSTYLE.CLIPPED_BITMAP;
  if(f.fillStyleType==FILLSTYLE.NON_SMOOTHED_REPEATING_BITMAP)f.fillStyleType=FILLSTYLE.REPEATING_BITMAP;
  fills++;return true;
 }
 static boolean patch(FILLSTYLEARRAY a,LINESTYLEARRAY lines){
  boolean changed=false;
  if(a!=null && a.fillStyles!=null)for(var f:a.fillStyles)changed|=patch(f);
  if(lines!=null && lines.lineStyles2!=null)for(var l:lines.lineStyles2)if(l.hasFillFlag)changed|=patch(l.fillType);
  return changed;
 }
 public static void main(String[] args)throws Exception{
  SWF swf=new SWF(new FileInputStream(args[0]),false);
  int[] ids={77,82,61};String[] paths={"assets/hud/lives-plane-clean.png","assets/hud/checkpoint-ring-clean.png","assets/branding/island-stunt-pilot-logo.png"};
  for(int i=0;i<ids.length;i++){
   ImageTag tag=(ImageTag)swf.getCharacter(ids[i]);var old=tag.getImageDimension();var image=ImageIO.read(new File(paths[i]));
   if(!image.getColorModel().hasAlpha())throw new IllegalStateException("HUD image needs alpha: "+paths[i]);
   ratios.put(ids[i],new double[]{old.width/(double)image.getWidth(),old.height/(double)image.getHeight()});
   if(ids[i]==61){
    double scale=Math.min(old.width/(double)image.getWidth(),old.height/(double)image.getHeight());
    ratios.put(ids[i],new double[]{scale,scale,(old.width-image.getWidth()*scale)/2,(old.height-image.getHeight()*scale)/2});
   }
   tag.setImage(Files.readAllBytes(Path.of(paths[i])));tag.setModified(true);
   System.out.println("HUD "+ids[i]+": "+old.width+"x"+old.height+" -> "+image.getWidth()+"x"+image.getHeight());
  }
  for(var tag:swf.getCharacters(false).values())if(tag instanceof ShapeTag){
   ShapeTag shape=(ShapeTag)tag;var data=shape.getShapes();boolean changed=patch(data.fillStyles,data.lineStyles);
   for(var record:data.shapeRecords)if(record instanceof StyleChangeRecord){var change=(StyleChangeRecord)record;if(change.stateNewStyles)changed|=patch(change.fillStyles,change.lineStyles);}
   if(changed)shape.setModified(true);
  }
  if(fills<3)throw new IllegalStateException("Expected HUD and logo bitmap fill references, found "+fills);
  try(OutputStream out=new FileOutputStream(args[1])){swf.saveTo(out);}
  System.out.println("Adjusted "+fills+" HUD bitmap fills; original HUD geometry retained");
 }
}
