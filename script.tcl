# TODO: --- Helper procedures ---

proc compareMinString {lineLength currentMin} {
  set minLength $currentMin
  if {$lineLength < $currentMin} {
    set minLength $lineLength
  }

  return $minLength
}

proc compareMaxNum {numVal currentMax} {
  set maxNum $currentMax
  if {$numVal > $currentMax} {
    set maxNum $numVal
  }

  return $maxNum
}

proc checkOddEven {line evenNumbers oddNumbers} {
  if {$line % 2 == 0} {
    puts [expr $line * 3.25]
    set evenNumbers [expr $evenNumbers + 1]
  } else {
    puts [expr $line / 2.0]
    set oddNumbers [expr $oddNumbers + 1]
  }

  return [list $evenNumbers $oddNumbers]
}

proc raiseInvalid {invalidLines} {
  puts "INVALID LINE\n"
  return [expr $invalidLines + 1]
}

# TODO: --- File processor ---

proc readFile {} {
  set file [open input.txt r]

  set lineCounter 0
  set concatCounter 0
  set numCounter 0
  set strings 0
  set oddNumbers 0
  set evenNumbers 0
  set invalidLines 0
  set maxNum 0
  set concat ""
  array set sumNumbers {}

  while {[gets $file line] >= 0} {
    set lineLength [string length $line]
    set lineCounter [expr $lineCounter + 1]
    puts "Line $lineCounter:"
    if {[string trim $line] eq ""} {
      set invalidLines [raiseInvalid $invalidLines]
      continue
    }
    if {$lineCounter == 1} {
      set minString [string length $line]
    }

    set minString [compareMinString $lineLength $minString]

    if {[string is integer -strict $line]} {
      set maxNum [compareMaxNum $line $maxNum]
      if {$numCounter < 2} {
        set numCounter [expr $numCounter + 1]
        set sumNumbers("num$numCounter") $line
      }

      set oddEvenResult [checkOddEven $line $evenNumbers $oddNumbers]
      set evenNumbers [lindex $oddEvenResult 0]
      set oddNumbers [lindex $oddEvenResult 1]
    } else {
      if {![string is double $line] && [string is integer -strict [string index $line 0]]} {
        set invalidLines [raiseInvalid $invalidLines]
        continue
      } else {
        puts $line
        if {$concatCounter < 3} {
          set concatCounter [expr $concatCounter + 1]
          set concat "$concat $line"
        }
        set strings [expr $strings + 1]
      }
    }
    puts "- length: $lineLength\n"
  }

  puts "- Sum of first two numbers: [expr $sumNumbers("num1") + $sumNumbers("num2")]"
  puts "- Concatenation of first three strings:$concat"
  puts "- Max number value: $maxNum"
  puts "- Minimum string length: $minString"
  puts "- Number of lines:"
  puts "  - String: $strings"
  puts "  - Odd number: $oddNumbers"
  puts "  - Even number: $evenNumbers"
  puts "  - Invalid: $invalidLines"

  close $file
}

readFile