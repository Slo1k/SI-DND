import java.util.Observable;
import java.util.Observer;
import jclips.JClips;
import java.awt.*;
import java.awt.event.*;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.*;

public class DnD extends JFrame implements Observer, ActionListener{
	
	private static final long serialVersionUID = 1L;
    
    private JFrame mainFrame = new JFrame("DnD Race Picker");
	private JLabel questionLabel = new JLabel();
	private ButtonGroup buttonGroup = new ButtonGroup();
	private static JRadioButton [] radioButton = new JRadioButton[10];
	private JButton nxtButton = new JButton("OK");
	private JButton endButton = new JButton("Zakoncz");
	
    private JClips jclips;

	private String [] clipsFact = new String[10];
    private int rbCount;

    public DnD(JClips jclp){
    	
    	jclips = jclp;
		mainFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    	mainFrame.setSize(400, 625);
    	mainFrame.setResizable(false);
    	try {
			mainFrame.setContentPane(new JLabel(new ImageIcon(ImageIO.read(new File("resources/bg.png")))));
		} catch (IOException e) {
			e.printStackTrace();
		}
    	mainFrame.setVisible(true);
    	mainFrame.setLayout(null);

    	questionLabel.setBounds(50, 20, 300, 80);
    	questionLabel.setFont(new Font("Monotype Corsiva", Font.BOLD, 18));
    	questionLabel.setForeground(new Color(0,0,0));
    	questionLabel.setHorizontalAlignment(JLabel.CENTER);
    	
    	mainFrame.getContentPane().add(questionLabel);
    
        
        for(int i=0;i<9;i++)
        {
        	radioButton[i] = new JRadioButton();
        	radioButton[i].setBounds(50, 100+(i*50), 300, 50);
        	radioButton[i].setContentAreaFilled(false);
    		radioButton[i].setVisible(false);
    		radioButton[i].setFont(new Font("Monotype Corsiva", Font.BOLD, 16));
    		buttonGroup.add(radioButton[i]);
    		mainFrame.getContentPane().add(radioButton[i]);
   		
        }
        
        nxtButton.addActionListener(this);
    	mainFrame.getContentPane().add(nxtButton);
        
        endButton.addActionListener(this);
        endButton.setVisible(false);
        mainFrame.getContentPane().add(endButton);
	}
	
	public static void setRBvisible(int num)
    {
    	for(int i=0;i<num;i++)
    	{
    		radioButton[i].setVisible(true);
    		radioButton[i].setSelected(false);
    		if(i==0) 
    			radioButton[0].setSelected(true);
    	}
    }
	
	public static void setRBinvisible(){
	    for(int i=0;i<9;i++)
	    {
	    	radioButton[i].setVisible(false);
	    }
    }
	
	public String formatText(String toParse) {
		String out = new String("");
		int i = 0;
		for (int j=0; j < toParse.length(); j++) {
			if (toParse.charAt(j) == ' ')
				i++;
			if (i == 5) {
				out += "<br>";
				i = 0;
			}
			out += toParse.charAt(j);
		}
		out = "<html>" + out + "</html>";
		return out;
	}
	
	public void update(Observable jClips, Object messageObj) {
		String message = (String) messageObj;
        clipsFact = message.split("@");
        if(!clipsFact[clipsFact.length-1].equals("odpowiedz"))
        {
        questionLabel.setText(formatText(clipsFact[0]));
        rbCount = Integer.parseInt(clipsFact[1]);
        setRBinvisible();
        setRBvisible(rbCount);
        for (int i=0; i< rbCount; i++)
        {
        	radioButton[i].setText(formatText(clipsFact[2+i]));
        }
        nxtButton.setBounds(150,140+50*rbCount,80,30);
        }
        else 
        {
        	setRBinvisible();
        	nxtButton.setVisible(false);
            endButton.setVisible(true);    
        	endButton.setBounds(130,425,120,30);
        	questionLabel.setBounds(80,25,240,380);
            questionLabel.setText("<html><center>Odpowiednia dla ciebie rasa to:<br>" + clipsFact[0] + "</center></html>");	
        	ImageIcon imageIcon = new ImageIcon("resources/" + clipsFact[0]+".png");
        	Image image = imageIcon.getImage();
        	Image newimg = image.getScaledInstance(225, 300,  java.awt.Image.SCALE_SMOOTH);
        	imageIcon = new ImageIcon(newimg);
        	questionLabel.setIconTextGap(25);
        	questionLabel.setVerticalTextPosition(JLabel.TOP);
        	questionLabel.setHorizontalTextPosition(JLabel.CENTER);
            questionLabel.setIcon(imageIcon);
        }
    }

	public void actionPerformed(ActionEvent e) {
        if(e.getSource()==nxtButton){
        for(int i=0;i<rbCount;i++)
		   {
        		if (radioButton[i].isSelected()) 
        			{
					   jclips.executeCommand("(assert ("+clipsFact[clipsFact.length-1]+" "+ clipsFact[2+i]+"))");
					}				   
		   }
		   if (clipsFact[2].equals("null") && !clipsFact[clipsFact.length-1].equals("odpowiedz")) 
		   {
			   jclips.executeCommand("(assert ("+clipsFact[clipsFact.length-1]+"))");
		   }
		   jclips.run();
    }
        else if(e.getSource()==endButton){
        	jclips.deallocate();
        	mainFrame.dispose();
        	System.exit(0);
        }
}
}