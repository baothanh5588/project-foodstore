package utils;

import org.apache.commons.io.FilenameUtils;

public class RenameFile {
 
 public String renameFile(String fileName){
      return FilenameUtils.getBaseName(fileName)+"-"+System.nanoTime()+"."+FilenameUtils.getExtension(fileName);
 }
 
}