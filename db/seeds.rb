board1 = Board.create!(level: "Very Easy", url: "/images/boards/board1.jpg")
board1.characters.create!(name: "Waldo", top: 658, left: 620)
board1.characters.create!(name: "Wenda", top: 531, left: 630)
board1.characters.create!(name: "Wizard", top: 670, left: 925)
30.times { board1.scores.create(score: 999) }

board2 = Board.create!(level: "Easy", url: "/images/boards/board2.jpg")
board2.characters.create!(name: "Waldo", top: 353, left: 492)
board2.characters.create!(name: "Wizard", top: 355, left: 584)
board2.characters.create!(name: "Odlaw", top: 355, left: 224)
30.times { board2.scores.create(score: 999) }

board3 = Board.create!(level: "Normal", url: "/images/boards/board3.jpg")
board3.characters.create!(name: "Waldo", top: 256, left: 463)
board3.characters.create!(name: "Wenda", top: 285, left: 670)
board3.characters.create!(name: "Wizard", top: 245, left: 2)
30.times { board3.scores.create(score: 999) }

board4 = Board.create!(level: "Hard", url: "/images/boards/board4.jpg")
board4.characters.create!(name: "Waldo", top: 240, left: 819)
board4.characters.create!(name: "Wenda", top: 469, left: 334)
board4.characters.create!(name: "Wizard", top: 252, left: 388)
board4.characters.create!(name: "Odlaw", top: 484, left: 219)
30.times { board4.scores.create(score: 999) }

board5 = Board.create!(level: "Very Hard", url: "/images/boards/board5.jpg")
board5.characters.create!(name: "Waldo", top: 130, left: 465)
board5.characters.create!(name: "Wenda", top: 516, left: 332)
board5.characters.create!(name: "Wizard", top: 36, left: 766)
board5.characters.create!(name: "Odlaw", top: 512, left: 218)
30.times { board5.scores.create(score: 999) }

board6 = Board.create!(level: "Insane", url: "/images/boards/board6.jpg")
board6.characters.create!(name: "Waldo", top: 194, left: 397)
board6.characters.create!(name: "Wenda", top: 176, left: 155)
board6.characters.create!(name: "Wizard", top: 620, left: 770)
board6.characters.create!(name: "Odlaw", top: 407, left: 172)
30.times { board6.scores.create(score: 999) }
