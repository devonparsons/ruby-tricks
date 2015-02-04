# Number: 11
# Title: Tail Call Optimization
# Comment: Yeah, it's in there
# Credit: Aaron Patterson
# Invocation: natural
# Transcript:
# FIXME

RubyVM::InstructionSequence.compile_option = { tailcall_optimization: true, trace_instruction: false}

eval << end
  def factorial(n, result = 1)
    if n == 1
      result
    else
      factorial(n - 1, n * result)
    end
  end
end

p factorial(30_000)
