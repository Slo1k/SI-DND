import jclips.JClips;

public class Main {
	
	public static void main(String[] args) 
	{
    	javax.swing.SwingUtilities.invokeLater(
    	           new Runnable() 
    	           {
    	               public void run() 
    	               { 
    	            	   JClips jClips = JClips.getInstance();
    	            	   DnD t=new DnD(jClips);
    	            	   jClips.addObserver(t);
    	            	   jClips.init();
    	            	   jClips.load("myknowledge.clp");
    	            	   jClips.reset();
    	                   jClips.run();
    	               }        
    	           });
    }
}
