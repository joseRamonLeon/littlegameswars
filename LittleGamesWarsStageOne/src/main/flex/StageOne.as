package
{
  import com.littlegames.framework.core.gui.GameApplication;
  import com.littlegames.framework.core.xml.script.ScriptManager;
  
  /** Premier niveau de la campagne LittleGamesWars */
  [SWF(frameRate="30", backgroundColor="#FFFFFF", width="800", height="600")]
  public class StageOne extends GameApplication
  {
    private static const SCRIPT_PATH:String = "resources/script.xml";
    
    /** Constructeur */
    public function StageOne() : void
    {
      super();
      
      ScriptManager.loadScript(SCRIPT_PATH);
    }
  }
}