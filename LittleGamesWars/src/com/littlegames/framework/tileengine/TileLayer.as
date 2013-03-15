package com.littlegames.framework.tileengine
{
  import com.littlegames.framework.tileengine.tiles.BaseTile;
  import com.littlegames.framework.tileengine.tiles.TilesId;

  public class TileLayer
  {
    /** Liste des tiles du layer */
    public var listTiles:Vector.<BaseTile>;
    /** Dimensions */
    public var numTilesW:uint = 0;
    public var numTilesH:uint = 0;
    
    /** Constructeur */
    public function TileLayer(pNumTilesW:uint = 0, pNumTilesH:uint = 0)
    {
      listTiles = new <BaseTile>[];
      numTilesW = pNumTilesW;
      numTilesH = pNumTilesH;
      fillTiles(TilesId.GRASS);
    }
    
    /** Initialize toutes les tiles avec de l'herbe */
    public function fillTiles(pTileId:uint) : void
    {
      listTiles.length = 0;
      var totalTiles:uint = numTilesW * numTilesH;
      for (var i:uint = 0; i < totalTiles; i++)
      {
        listTiles.push(new BaseTile(pTileId));
      }
    }
    
    /** Retourne une tile aux coordonnées spécifiées */
    public function getTileAt(pX:uint, pY:uint) : BaseTile
    {
      if (!validCoordinates(pX, pY)) return null;
      return listTiles[pX+pY*numTilesW];
    }

    /** Vérifie la validité des coordonnées */
    private function validCoordinates(pX:uint, pY:uint) : Boolean
    {
      return pX < numTilesW && pY < numTilesH;
    }
    
    /** Définit une tile aux coordonnées spécifiées */
    public function setTileAt(pX:uint, pY:uint, pTile:BaseTile) : void
    {
      if (!validCoordinates(pX, pY)) return;
      listTiles[pX+pY*numTilesW] = pTile;
    }
    
    /** Récupère une tile aléatoirement */
    public function getRandomTile() : BaseTile
    {
      return listTiles[(uint)(Math.random() * numTilesH * numTilesW - 1)];
    }
  }
}