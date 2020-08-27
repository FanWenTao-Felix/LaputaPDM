package com.laputa.pdm.common.core.util;

import org.apache.commons.io.IOUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.LinkedList;

public class FileUtil {

    /**
     * 写文件 方法
     *
     * @param response
     * @param file
     * @throws IOException
     */
    public static void writefile(HttpServletResponse response, File file) {
        ServletOutputStream sos = null;
        FileInputStream aa = null;
        try {
            aa = new FileInputStream(file);
            sos = response.getOutputStream();
            // 读取文件问字节码
            byte[] data = new byte[(int) file.length()];
            IOUtils.readFully(aa, data);
            // 将文件流输出到浏览器
            IOUtils.write(data, sos);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                sos.close();
                aa.close();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }


    }

    public static void traverseFolder1(String path ){
//        String path = "D:\\TEST";
        int fileNum = 0;
        int folderNum = 0;
        int foldeNum = 0;
        File file = new File(path);
        if (file.exists()) {
            LinkedList<File> list = new LinkedList<File>();

            //list()方法是返回某个目录下的所有文件和目录的文件名，返回的是String数组

            //listFiles()方法是返回某个目录下所有文件和目录的绝对路径，返回的是File数组
            File[] files = file.listFiles();
            for (File file2 : files) {
                if (file2.isDirectory()) {
                    System.out.println("文件夹:" + file2.getAbsolutePath());
                    list.add(file2);
                    foldeNum++;
                } else {
                    changeName(file2);
                    System.out.println("文件:" + file2.getAbsolutePath());
                    fileNum++;
                }
            }
            File temp_file;
            while (!list.isEmpty()) {
                temp_file = list.removeFirst();//删除第一个元素，也就是找到数组中的第一个元素返回一个File去判断，说白了就是循环分别找到每个文件下面对应的是文件还是文件夹，如果循环下一级还是文件夹则继续循环直到结束（思想就是一层一层去判断查找知道找到所有的文件和文件夹，不明白看下面的例子。）
                files = temp_file.listFiles();
                for (File file2 : files) {
                    if (file2.isDirectory()) {//如果是个目录(文件夹)则返回true
                        System.err.println("文件夹:" + file2.getAbsolutePath());
                        list.add(file2);
                        folderNum++;
                    } else {//输出文件
                        changeName(file2);
                        System.out.println("文件:" + file2.getAbsolutePath());//返回文件的完整路径。
                        fileNum++;
                    }
                }
            }
        } else {
            System.out.println("文件不存在!");
        }
        System.out.println("文件夹共有:" + folderNum + ",文件共有:" + fileNum);
    }

    private static  void changeName(File file){
        System.out.println(file.getAbsoluteFile());
        String oldName = file.getAbsoluteFile().toString();
        oldName = oldName.replace("【瑞客论坛 www.ruike1.com】", "");
        File newFile = new File(oldName);
        System.out.println(oldName);
        try {
            file.renameTo(newFile); // 修改文件名
        } catch (Exception err) {
            err.printStackTrace();
            return ;
        }
    }
//    public static void main(String[] args) {
////        traverseFolder1("J:\\2019年8月尚硅谷Kubernetes");
////        File path = new File("J:\\2019年8月尚硅谷Kubernetes");
////        File[] files = path.listFiles();
////        for (File file : files) {
////            System.out.println(file.getAbsoluteFile());
////            String oldName = file.getAbsoluteFile().toString();
////            oldName = oldName.replace("【瑞客论坛 www.ruike1.com】", "");
////            File newFile = new File(oldName);
////            System.out.println(oldName);
////            try {
////                file.renameTo(newFile); // 修改文件名
////            } catch (Exception err) {
////                err.printStackTrace();
////                return ;
////            }
////        }
//
//
//    }
}
