package com.laputa.pdm.common.core.util;

import org.apache.commons.io.FilenameUtils;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.*;

/**
 * 图像处理辅助类
 *
 * @author 小明
 *
 */
public class ImageUtil {

//    public static void main(String[] args) throws IOException {
//        splitImage("E:\\MicroServicesProjects\\laputa doc\\icons\\icons-small.png",
//                "E:\\MicroServicesProjects\\laputa doc\\icons\\output\\");
//    }

    /**
     * 分割图像
     *
     * @param image
     *            传入的图片对象
     * @param rows
     *            垂直方向上需要裁剪出的图片数量 - 行
     * @param cols
     *            水平方向上需要裁剪出的图片数量 - 列
     * @param x
     *            开始裁剪位置的X坐标
     * @param y
     *            开始裁剪位置的Y坐标
     * @param width
     *            每次裁剪的图片宽度
     * @param height
     *            每次裁剪的图片高度
     * @param changeX
     *            每次需要改变的X坐标数量
     * @param changeY
     *            每次需要改变的Y坐标数量
     * @param component
     *            容器对象，目的是用来创建裁剪后的每个图片对象
     * @return 裁剪完并加载到内存后的二维图片数组
     */
    public static Image[][] cutImage(Image image, int rows, int cols, int x,
            int y, int width, int height, int changeX, int changeY,
            Component component) {
        Image[][] images = new Image[rows][cols];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                ImageFilter filter = new CropImageFilter(x + j * changeX, y + i
                        * changeY, width, height);
                images[i][j] = component.createImage(new FilteredImageSource(
                        image.getSource(), filter));
            }
        }

        return images;
    }

    private static void splitImage(String originalImg ,String destination ) throws IOException {

        //String originalImg = "C:\\img\\split\\a380_1280x1024.jpg";

//        String originalImg = "E:\\project_server\\spring-elfinder-master\\elfinder-web\\src\\main\\resources\\static\\elfinder\\img\\toolbar.png";
        // 读入大图
        File file = new File(originalImg);
        FileInputStream fis = new FileInputStream(file);
        BufferedImage image = ImageIO.read(fis);

        // 分割成4*4(16)个小图
        int rows = 64;
        int cols = 1;
        int chunks = rows * cols;
        int size = image.getHeight()/image.getWidth();
        System.out.println("size:"+size);
        // 计算每个小图的宽度和高度
        int chunkWidth = image.getWidth() / cols;
        int chunkHeight = image.getHeight() / size ;
        System.out.println("chunkWidth:"+chunkWidth+ " chunkHeight:"+chunkHeight);
        int count = 0;
        BufferedImage imgs[] = new BufferedImage[size];
        for (int x = 0; x < size; x++) {
            for (int y = 0; y < cols; y++) {
                //设置小图的大小和类型
                imgs[count] = new BufferedImage(chunkWidth, chunkHeight, image.getType());

                //写入图像内容
                Graphics2D gr = imgs[count++].createGraphics();
                gr.drawImage(image, 0, 0,
                        chunkWidth, chunkHeight,
                        chunkWidth* y, chunkHeight * x,
                        chunkWidth * y + chunkWidth,
                        chunkHeight * x + chunkHeight, null);
                gr.dispose();
            }
        }
        String baseName = FilenameUtils.getBaseName(originalImg);
        // 输出小图
        for (int i = 0; i < imgs.length; i++) {
            //ImageIO.write(imgs[i], "jpg", new File("C:\\img\\split\\img" + i + ".jpg"));
            ImageIO.write(imgs[i], "png", new File(destination+baseName +"_"+ i + ".png"));
        }

        System.out.println("完成分割！");
    }

    private static void mergeImage() throws IOException {

        int rows = 3;
        int cols = 3;
        int chunks = rows * cols;

        int chunkWidth, chunkHeight;
        int type;

        //读入小图
        File[] imgFiles = new File[chunks];
        for (int i = 0; i < chunks; i++) {
            imgFiles[i] = new File("d:\\img2\\img" + i + ".jpg");
        }

        //创建BufferedImage
        BufferedImage[] buffImages = new BufferedImage[chunks];
        for (int i = 0; i < chunks; i++) {
            buffImages[i] = ImageIO.read(imgFiles[i]);
        }
        type = buffImages[0].getType();
        chunkWidth = buffImages[0].getWidth();
        chunkHeight = buffImages[0].getHeight();

        //设置拼接后图的大小和类型
        BufferedImage finalImg = new BufferedImage(chunkWidth * cols, chunkHeight * rows, type);

        //写入图像内容
        int num = 0;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                finalImg.createGraphics().drawImage(buffImages[num], chunkWidth * j, chunkHeight * i, null);
                num++;
            }
        }

        //输出拼接后的图像
        ImageIO.write(finalImg, "jpeg", new File("d:\\img2\\finalImg.jpg"));
        InputStream is=(InputStream) ImageIO.createImageInputStream(finalImg);

        System.out.println("完成拼接！");
    }

    public static InputStream mergeImage_1(String path,String name,String prefix) throws IOException {

        int rows = 3;
        int cols = 3;
        int chunks = rows * cols;

        int chunkWidth, chunkHeight;
        int type;

        //读入小图
        File[] imgFiles = new File[chunks];
        for (int i = 0; i < chunks; i++) {
            imgFiles[i] = new File(path+name +"_"+ i+"."+prefix);
        }

        //创建BufferedImage
        BufferedImage[] buffImages = new BufferedImage[chunks];
        for (int i = 0; i < chunks; i++) {
            buffImages[i] = ImageIO.read(imgFiles[i]);
        }
        type = buffImages[0].getType();
        chunkWidth = buffImages[0].getWidth();
        chunkHeight = buffImages[0].getHeight();

        //设置拼接后图的大小和类型
        BufferedImage finalImg = new BufferedImage(chunkWidth * cols, chunkHeight * rows, type);

        //写入图像内容
        int num = 0;
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                finalImg.createGraphics().drawImage(buffImages[num], chunkWidth * j, chunkHeight * i, null);
                num++;
            }
        }

        //输出拼接后的图像
        //ImageIO.write(finalImg, "jpeg", new File("d:\\img2\\finalImg.jpg"));
        //InputStream is=(InputStream) ImageIO.createImageInputStream(finalImg);
        finalImg.flush();
        ByteArrayOutputStream bs = new ByteArrayOutputStream();
        InputStream is=null;
        ImageOutputStream imOut;
        imOut = ImageIO.createImageOutputStream(bs);
        ImageIO.write(finalImg, prefix,imOut);
        is= new ByteArrayInputStream(bs.toByteArray());
        System.out.println("完成拼接！");
        return is;
    }
}
