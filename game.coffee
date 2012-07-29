class Game
  player: Player
  map: Map
  
class Player
  hand: Hand
  soldiers: []
  
class Hand
  cards: []

class Deck
  cards: []
  
class Card
  cost

class Map
  tiles: []
  
class Tile
  building: null

class Soldier
  x
  y
  building: Building
  
class Building
  sight
  influence
  production