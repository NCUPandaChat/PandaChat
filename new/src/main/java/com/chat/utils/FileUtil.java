package com.chat.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;


public class FileUtil {

    public File[] getFileArrayByString(String files, String split){
        String[] aa = files.split(split);
        File[] attachments = new File[aa.length];
        for(int i=0;i<aa.length;i++){
            attachments[i] = new File(aa[i]);
        }
        return attachments;
    }

    public String getFilePrefix(MultipartFile file){
        String fileName=file.getOriginalFilename();
        return fileName.substring(fileName.lastIndexOf(".")+1);
    }
//    public boolean deleteFile(String userid){
//        String path = "E:/apache-tomcat-9.0.8/webapps/upload/webchat/";
//        File dirFile = new File(path+userid);
//        if (!dirFile.exists()) {
//            return false;
//        }
//
//        if (dirFile.isFile()) {
//            return dirFile.delete();
//        } else {
//
//            for (File file : dirFile.listFiles()) {
//                deleteFile(file);
//            }
//        }
//
//        return dirFile.delete();
//
//    }

}
