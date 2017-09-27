//: [Previous](@previous)
/*
 --- Day 2: Bathroom Security ---
 
 You arrive at Easter Bunny Headquarters under cover of darkness. However, you left in such a rush that you forgot to use the bathroom! Fancy office buildings like this one usually have keypad locks on their bathrooms, so you search the front desk for the code.
 
 "In order to improve security," the document you find says, "bathroom codes will no longer be written down. Instead, please memorize and follow the procedure below to access the bathrooms."
 
 The document goes on to explain that each button to be pressed can be found by starting on the previous button and moving to adjacent buttons on the keypad: U moves up, D moves down, L moves left, and R moves right. Each line of instructions corresponds to one button, starting at the previous button (or, for the first line, the "5" button); press whatever button you're on at the end of each line. If a move doesn't lead to a button, ignore it.
 
 You can't hold it much longer, so you decide to figure out the code as you walk to the bathroom. You picture a keypad like this:
 
 1 2 3
 4 5 6
 7 8 9
 
 Suppose your instructions are:
 
 ULL
 RRDDD
 LURDL
 UUUUD
 
 You start at "5" and move up (to "2"), left (to "1"), and left (you can't, and stay on "1"), so the first button is 1.
 Starting from the previous button ("1"), you move right twice (to "3") and then down three times (stopping at "9" after two moves and ignoring the third), ending up with 9.
 Continuing from "9", you move left, up, right, down, and left, ending with 8.
 Finally, you move up four times (stopping at "2"), then down once, ending with 5.
 
 So, in this example, the bathroom code is 1985.
 
 Your puzzle input is the instructions from the document you found at the front desk. What is the bathroom code?

 */


import Foundation

class KeyPad{
    private let keys: [[Int]] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
    ]
    
    //for the first line
    private var rows = 1
    private var columns = 1
    
    public func getCurrentNumber() -> Int{
        return keys[self.rows][self.columns]
    }
    
    public func move(_ direction: Character){
        switch direction {
        case "U":
            if self.rows > 0{
                self.rows -= 1
            }
        case "D":
            if self.rows < 2{
                self.rows += 1
            }
        case "L":
            if self.columns > 0{
                self.columns -= 1
            }
        case "R":
            if self.columns < 2{
                self.columns += 1
            }
        default:
            print("invalid button pressed!!!")
        }
    }
}

let instructions = ["RRLLDDRLLDURLDUUDULDLRLDDDRLDULLRDDRDLUUDLLRRDURRLUDUDULLUUDRUURRDDDDURUULLDULRLRRRDLLLRDLRDULDLRUUDRURLULURUUDRLUUDRDURUUDDDRDLLRDLUDRLUUUUUULDURDRDDURLDDRLUUDLRURRDRLDRDLRRRLURULDLUUURDRLUULRDUDLDRRRDDLDDDRLRLLDRDUURDULUURRRRUDLLUDLDRLLRRULLLRDRDRRDRDRDUULUDLULRLLDRULURLURDLLDDRRLUDRDUULLDRULLLRLULUDDLURLUULDRUDRLDUUDDLLLRURDRLDRLUUUUUUDRUDLDLULULRRURRDDDUDRRRDDDLDDLRLLDDUULLUDRURDDDRDDLURRURULULUUDRLLUUDDDRUULRDLDLLRUUDRRLRRRULLRRURUDDUUDULDUDUUUDURUDUUDUDRULUDULRDUDUUUUDLLURDLRRUDURDDUULLDLLRDUDULRLRDURLRDRDLRDLRURUDURLULDDDLDRLULLRLURRLLDLRLLULLDUURUUDRULDDUDLDDR", "LUURULURUURRRDLRDRDDDUDULRDDLUUDUUULRLRRLRUDDLDLURLRULUUDUUDLDRLLUURLUUURDUDLUULLUUDUUDRDUDUDURLLURDUDLDLDDLDUDRLLUULDDRUDDDRLRUDRDUDULLRRDLLDDLRLLLRLRURURLLDULUDDUULULDRRLUURDULRULUDULDULDULRULLLRRDRLDRLDUULLDDULRLUDLLLULDDLULLUULUURRULDLUULDRRUDDDLRDLULDULDRRDLRRRLRUDURUDDDUDDURRRLDUULRDDLRRRLRUULDDURDRDUULDLLULULDRDRUULDLULRUUDUDLUDRLRDURRRRLULURDRLLLUDRRRDRURRLRLLUURDLURLURDULURUDDULLDUUDDLRLUULRDUUDRDRUDRLUUUDURLLRDRRDRURDDDDULLDDUDLDUUDLRLURURLDRRDRDUDLRRDRUDRDLURRLLLULULULRUDDDULULULDDRRLULUUUURDDURURLDLDDDDDRULUUUULLUDDDRRLUULDUULRUUDUURRLLRDDRUURL", "RRRLLLLUULLRRLLDRULULLLRDLLDLDDLURUDLULUULLRURLDULLUDULDRURDURLULLDUDDRLLRUURDLLULUURLULLDLRRDDDULUURRUDRDRDURULDLLURUDLLLDDUDLLLLRLDRDRDDRRDLUUDLLLULLLLLDDRDLULLLLRURRRUUUULLDLRDLDLRRRULRRRRLDLLRDURULDDLURURUULULDRDDDURLRDDRDULLUURUDUUUDRDRRLURULULRLUUDDRDULDRLULULUULRLDRLUDRRDDDRUDDRDDRDDRRLRDLRURDULULRRUUURDRRRDURDDRUDULUUDRDDLDRDDDULDLRDUULDUULRUDLRRDDDLLDDLLLRRDLDUULUULULURRULLRRUDUDRUDRRRLDLRLURRLUDLLLUUDDUDRURUUDDURDURULRLDUDRDLULDUDRUDDDR", "DRDRRUUUUURRLUDLDLRUUULRLDLRRRDDUDLUUDUDDLRDUDLRRLLURUUDULLUDLULLDLLDDULUDDUDUULURLDLDDUUDDRDDRLUURLUUDUDUDURULLDRLDDRUDLURRRLDRLRULDDLDDLDDDULDUDDLLDULUUDUDDUULDRLDRLRURDULUDDRRLRRLRRDULDRRDUDUDRLDURRLRLRDLRLRRLRDDDRULLULULDUDDLDLULRLLURRRRULUULRUDLDLRDLLURURUUURDRRRLDDRLRLURDDURDDUURUUUDDLRUURRRDLLUULUDRLDDRDDDDUUDRLRRDULDULRDLLLRULULLRDRULLRDLRUUURRRURLRRDLDRDDLURLDLULLDUURRDULUUURRLLDDUUUULDDDDLRDDDRDLDLLUURLDDRULUDDRDDDLRDU", "DRRRLURUDUDUULDLLURLUUDDRRRDUDLURLLDRRLLDDURULUDUURURULLRLDLLUURDLLDLLDLDLRUDLLLLDRLLUDLLDULDDRRURDRRLRLRRUURRUDURRLDRDLDURUULUDRLLURLUDURDULLRLLDLURLRRDLLLLUUDRDULLDLURDULDRDURRRLDRLURULULURLLLRRRUULRLRRDRDDDLULRLRRDLUDDUUUUUDRRDLDUDUURLDRRRLRUDRULDRLURUULRDLDDLRURDLURULRRLDURLDUURURULRDUDRRUDUDDLRLUURURULDDLULULULDULRRLRRURUURLRLLDRRLUDLUURDRRURRUUDULRLURRLRLRDDRURDDLRRDUDRLLUUUDULRDRULUURRLRLRDUDULDRDLLUDRDLLDRULDLUUURDDRDDUDDULLLDRRDDUDDDDLDDRLRULRRRURRDRULLDDDURDDLURRDDDUDLURRUDUDLLDDDLRUUDRLRRLRDUUUDDL"]

//let instructions = ["LLLR", "DRUULLLRRR"]

func getDigit(_ keyPad: KeyPad, _ instruction: String) -> Int{
    for direction in instruction.characters {
        keyPad.move(direction)
    }
    return keyPad.getCurrentNumber()
}

func fetchBathroomPass(_ instructions: [String]) -> String{
    var passKey = String()
    let keypad = KeyPad()
    
    for instruction in instructions{
        passKey += String(describing: getDigit(keypad, instruction))
    }
    return passKey
}

print(fetchBathroomPass(instructions))




//: [Next](@next)
