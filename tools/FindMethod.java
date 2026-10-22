import java.io.*;
import com.jpexs.decompiler.flash.SWF;
public class FindMethod {
 public static void main(String[] args) throws Exception {
  SWF swf=new SWF(new FileInputStream(args[0]),false);
  for(var tag:swf.getAbcList()) { var abc=tag.getABC();
   for(int i=0;i<abc.bodies.size();i++){var body=abc.bodies.get(i); var method=abc.method_info.get(body.method_info); String name=abc.constants.getString(method.name_index);if(name!=null && name.contains("TextureMaterial/")&&name.endsWith(":draw"))System.out.println(i+" "+name);}
  }
 }
}
