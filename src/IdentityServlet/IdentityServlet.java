package IdentityServlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.imageio.plugins.jpeg.JPEGImageReadParam;
import javax.imageio.plugins.jpeg.JPEGImageWriteParam;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sun.image.codec.jpeg.JPEGImageEncoder;
import com.sun.image.codec.jpeg.JPEGCodec;

public class IdentityServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//随机字符字典
	public static final char [] chars={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h'
		,'i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
		'P','Q','R','S','T','U','V','W','X','Y','Z'};
	//随机数
	public static Random random=new Random();
	
	//获取6位随机数
	public static String getRandomString(){
		StringBuffer buffer=new StringBuffer();//字符串缓存
		for(int i=0;i<6;i++){
			buffer.append(chars[random.nextInt(chars.length)]);//每次去一个随机字符
		}
		return buffer.toString();
	}
	//获取随机的颜色
	public static Color getRandomColor(){
		return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
	}
	//返回某颜色的反色
	public static Color getReverseColor(Color c){
		return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg"); //设置输出类型
		
		String randomString=getRandomString();//随机字符串
		
		request.getSession(true).setAttribute("randomString", randomString);//放进session中
		int width=100;//图片宽高
		int height=30;
		
		Color color=getRandomColor();//随机色用于背景色
		Color Reverse=getReverseColor(color);//反色，用于前景色
		
		BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);//创建一个彩色图片
		
		Graphics2D g=bi.createGraphics();//获取绘图对象
		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));//设置字体
		g.setColor(color);//设置颜色
		g.fillRect(0, 0, width, height);//绘制背景
		g.setColor(Reverse);//设置颜色
		g.drawString(randomString, 18, 20);//绘制随机字符
		
		
		/*//画出最多100个噪点
		for(int i=0 , n=random.nextInt(100) ; i<n ; i++){
			g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
			
		}*/
		Random random=new Random();
		for(int i=0;i<2;i++){
			int x=random.nextInt(100);
			int y=random.nextInt(30);
			int x2=random.nextInt(100);
			int y2=random.nextInt(30);
			g.drawLine(x, y, x2, y2);
		}
		
		ServletOutputStream out=response.getOutputStream();//转成JPEG格式
		JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);//编码器
		encoder.encode(bi);//对图片进行编码
		out.flush();//输出到客户端
	}

}
