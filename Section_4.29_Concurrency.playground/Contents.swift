import UIKit


/*
Challenge 1: Safe teams
Using the Playlist example as a guild, change the following class to make it safe to use in concurrent contexts:
 // 1
 actor Playlist {
   let title: String
   let author: String
   private(set) var songs: [String]
   
   init(title: String, author: String, songs: [String]) {
     self.title = title
     self.author = author
     self.songs = songs
   }
   
   func add(song: String) {
     songs.append(song)
   }
   
   func remove(song: String) {
     guard !songs.isEmpty, let index = songs.firstIndex(of: song) else {
       return
     }
     songs.remove(at: index)
   }
   
   // 3
   func move(song: String, from playlist: Playlist) async {
     // 2
     await playlist.remove(song: song)
     add(song: song)
   }
   
   func move(song: String, to playlist: Playlist) async {
     await playlist.add(song: song)
     remove(song: song)
   }
 }

*/


actor Team {
  let name: String
  let stadium: String
  private(set) var players: [String]
  
  init(name: String, stadium: String, players: [String]) {
    self.name = name
    self.stadium = stadium
    self.players = players
  }
  
  private func add(player: String) {
    players.append(player)
  }
  
  private func remove(player: String) {
    guard !players.isEmpty, let index = players.firstIndex(of: player) else {
      return
    }
    players.remove(at: index)
  }
  
    /*
     Both buy(player:from:) and sell(player:to:) have an additional Team as a parameter.
     This parameter means that they operate on two actors: self and team.
     I must use await to access team because the methods may have to wait their turn to get synchronized access to the team actor.
     
     Because buy(player:from:) and sell(player:to:) use await in their implementation, I must mark them as async.
     All actor methods are implicitly asynchronous already, but the implementation forces it to be explicit here.
     */
  func buy(player: String, from team: Team) async {
    await team.remove(player: player)
    add(player: player)
  }
  
  func sell(player: String, to team: Team) async {
    await team.add(player: player)
    remove(player: player)
  }
}


// I can now safely use teams in concurrent code:
let team1 = Team(name: "A", stadium: "aaa", players: ["Alice"])
let team2 = Team(name: "B" , stadium: "bbb", players: ["Bob"])

Task {
    await team1.buy(player: "Bob", from: team2)
    await team1.sell(player: "Alice", to: team2)
    await print("team1 players: \(team1.players)")
    await print("team2 players: \(team2.players)")
}

/*
 I need to use await here to isolate the actor. The requirement to write await makes it obvious that the method could suspend if another piece of code is in the middle of accessing the Team. This means only one piece of code can access Team at any given time, making it safe.
 
 Notice that I call add and remove without using await inside the implementation of the buy and sell methods. This is because the compiler knows you already have exclusive access to the instance.

 The actor prepares two internal methods for every method of an actor: one version that needs to await and another, fast version that doesn’t. The compiler knows which internal method it needs to call to maximize performance safely.
 */



/*
Challenge 2: Custom teams
Conform the asynchronous-safe type from the previous challenge to CustomStringConvertible.
*/

extension Team: CustomStringConvertible {
    nonisolated var description: String  {
        "\(name) plays at \(stadium)."
      }
}

print(team1)
print(team2)


/*
 Challenge 3: Sendable teams
 Make the following class Sendable:
 */

final class BasicTeam {
  let name: String
  let stadium: String
  
  init(name: String, stadium: String) {
    self.name = name
    self.stadium = stadium
  }
}

extension BasicTeam: Sendable {}

/*
 Here, BasicTeam is Sendable because it’s final, so it doesn’t support inheritance, and all of its stored properties are IMMUTABLE and Sendable.
 */

