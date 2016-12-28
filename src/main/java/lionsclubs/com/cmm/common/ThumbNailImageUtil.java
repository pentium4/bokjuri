package lionsclubs.com.cmm.common;

import java.awt.image.BufferedImage;
import java.io.File;
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
import org.springframework.util.FileCopyUtils;
import com.mortennobel.imagescaling.ResampleOp;

public class ThumbNailImageUtil {
	
	// 이미지이면 썸네일을 생성한다.
	public static void createThumnail(String uploadPullPath) {
		try {
			File fileIn = new File(uploadPullPath);
			ImageIcon ii = new ImageIcon( fileIn.getPath() ); 
	
			if(ii != null && ii.getIconWidth() != -1 && ii.getIconHeight() != -1 ) {
				File fileOut = new File(uploadPullPath + ".thumb");
				FileCopyUtils.copy(fileIn, fileOut);
				ImageIcon ii2 = new ImageIcon( fileOut.getPath() ); 

				int orgWidth  = ii2.getIconWidth();
				int orgHeight = ii2.getIconHeight();

				if(orgWidth > 200) {
					int newWidth = 200;
					int newHeight = newWidth * orgHeight / orgWidth ;
					BufferedImage src = ImageIO.read(fileOut);
	                ResampleOp resampleOp = new ResampleOp (newWidth,newHeight);
	                //resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.VerySharp);
	                BufferedImage rescaled = resampleOp.filter(src, null);
	                ImageIO.write(rescaled, "JPG", fileOut);
				}
			} 
		} catch (Exception e) {
		}
	}
}
