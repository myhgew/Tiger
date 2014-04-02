structure Test =
struct
    structure Frame : FRAME = MipsFrame

        fun pt filename =
            let
                
            in
                print("\n===Processing: "^filename^"===\n");

                
                Main.compile filename
            end

          fun test () = 
            let
             fun test n = 
              if n = 50 then ()
              else 
                if n = 33 then test(n+1)
                else (
                 pt("test/test"^Int.toString(n)^".tig");
                 test(n+1)
               ) 
          in
             pt "test/merge.tig";
             pt "test/queens.tig";

             test 1;
             print "***Test finish***\n"
         end

    fun testprint () = PrintAbsyn.print(TextIO.openOut("testoutput.sml"), Parse.parse("testinput.sml"))
    fun testprint filename = PrintAbsyn.print(TextIO.openOut(filename^"output"), Parse.parse(filename))
end

