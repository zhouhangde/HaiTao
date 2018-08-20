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
	//����ַ��ֵ�
	public static final char [] chars={'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h'
		,'i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
		'P','Q','R','S','T','U','V','W','X','Y','Z'};
	//�����
	public static Random random=new Random();
	
	//��ȡ6λ�����
	public static String getRandomString(){
		StringBuffer buffer=new StringBuffer();//�ַ�������
		for(int i=0;i<6;i++){
			buffer.append(chars[random.nextInt(chars.length)]);//ÿ��ȥһ������ַ�
		}
		return buffer.toString();
	}
	//��ȡ�������ɫ
	public static Color getRandomColor(){
		return new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
	}
	//����ĳ��ɫ�ķ�ɫ
	public static Color getReverseColor(Color c){
		return new Color(255-c.getRed(),255-c.getGreen(),255-c.getBlue());
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("image/jpeg"); //�����������
		
		String randomString=getRandomString();//����ַ���
		
		request.getSession(true).setAttribute("randomString", randomString);//�Ž�session��
		int width=100;//ͼƬ���
		int height=30;
		
		Color color=getRandomColor();//���ɫ���ڱ���ɫ
		Color Reverse=getReverseColor(color);//��ɫ������ǰ��ɫ
		
		BufferedImage bi=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);//����һ����ɫͼƬ
		
		Graphics2D g=bi.createGraphics();//��ȡ��ͼ����
		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 16));//��������
		g.setColor(color);//������ɫ
		g.fillRect(0, 0, width, height);//���Ʊ���
		g.setColor(Reverse);//������ɫ
		g.drawString(randomString, 18, 20);//��������ַ�
		
		
		/*//�������100�����
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
		
		ServletOutputStream out=response.getOutputStream();//ת��JPEG��ʽ
		JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(out);//������
		encoder.encode(bi);//��ͼƬ���б���
		out.flush();//������ͻ���
	}

}
