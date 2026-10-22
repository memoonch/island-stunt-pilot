import java.io.*;
import com.jpexs.decompiler.flash.SWF;
import com.jpexs.decompiler.flash.tags.base.TextTag;
import com.jpexs.decompiler.flash.tags.base.MissingCharacterHandler;
public class PatchMenuText {
 public static void main(String[] args)throws Exception{
  SWF swf=new SWF(new FileInputStream(args[0]),false);
  for(int id:new int[]{57,58,59}){
   TextTag tag=(TextTag)swf.getCharacter(id);
   String formatted=tag.getFormattedText(false).text;
   if(!formatted.contains("ADD THIS GAME TO YOUR SITE"))throw new IllegalStateException("Unexpected menu label "+id);
   if(!tag.setFormattedText(new MissingCharacterHandler(),formatted.replace("ADD THIS GAME TO YOUR SITE","PLAY MORE GAMES"),null))throw new IllegalStateException("Could not update label "+id);
   tag.setModified(true);
  }
  try(OutputStream out=new FileOutputStream(args[1])){swf.saveTo(out);}
  System.out.println("Updated original menu button text in all three states");
 }
}
