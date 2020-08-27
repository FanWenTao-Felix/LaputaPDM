package com.laputa.pdm.common.core.util;

import org.apache.commons.io.FilenameUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ImageMagicUtil {

    private static String ImageMagick = "D:\\Program Files\\ImageMagick-7.0.9-Q16\\magick.exe";

    public static void convetorToSvg(String path, String source)
            throws Exception {
        String name = FilenameUtils.getBaseName(source);

        List<String> command = new ArrayList<String>();
        command.add(ImageMagick);
        command.add(path+ File.separator+source);
        command.add(path+ File.separator+"convert"+File.separator+name+".svg");
        ProcessBuilder builder = new ProcessBuilder(command);
        Process process = null;
        try {
            process = builder.start();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        // 使用这种方式会在瞬间大量消耗CPU和内存等系统资源，所以这里我们需要对流进行处理
        InputStream errorStream = process.getErrorStream();
        InputStreamReader inputStreamReader = new InputStreamReader(errorStream);
        BufferedReader br = new BufferedReader(inputStreamReader);

        String line = "";
        while ((line = br.readLine()) != null) {
            System.out.println(line);
        }
        if (br != null) {
            br.close();
        }
        if (inputStreamReader != null) {
            inputStreamReader.close();
        }
        if (errorStream != null) {
            errorStream.close();
        }

    }

    public static void main(String[] args) {
//        String[] files = File.listRoots();

        String path = "E:\\MicroServicesProjects\\laputa doc\\filetype";
        File pathFile = new File(path);
        File[] files = pathFile.listFiles();
        for (File file : files) {
//         String name = FilenameUtils.getBaseName(file.getName());
            System.out.println(file.getName());
            try {
                convetorToSvg(path, file.getName());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
