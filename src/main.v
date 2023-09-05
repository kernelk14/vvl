module main
import arrays

enum Types as u8 {
	write
	integer
	quote
	lit
}

struct Token {
mut:
	name string
	code u8
	size int
}

fn analyze(tok Token, mut stack []string) {
	if tok.name == "write" {
		//stack.clear()
		println("${stack}: i know what you want to write")
	}
}

fn lex(input string) {
	str := input.runes()
	mut i := 0
	mut cur := ""
	mut stack := []string{}
	mut expstack := []string{}
	mut tok := Token{}
	for(i < str.len) {
		// println(str[i])
		cur += str[i].str()
		
		if cur == "write" {
			stack.clear()
			stack << cur
			tok.name = stack.pop()
			tok.code = 0
			tok.size = tok.name.len
			// println(cur)
			// println(str)
			// println("I saw a write!")
			cur = ""
			i += 1
		} else if cur == "'" {
			stack.clear()
			stack << cur
			tok.name = stack.pop()
			tok.code = 2
			tok.size = tok.name.len
			// println(cur)
			// println(str)
			// println("I saw a quotation!")
			cur = ""
		} else {
			if cur == " " {
				println("There is space")
			}	
			cur = ""
		}
		// println(stack)
		// stack.clear()
		stack << cur
		expstack << stack[stack.len -1]
		analyze(tok, mut expstack)
		i += 1
		
		// println("Cursor is: ${cur}")
	}
}

fn main() {
	demo := "write 'Hello World!'"
	lex(demo)
}
