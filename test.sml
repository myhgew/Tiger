structure Test =
struct
    structure Frame : FRAME = MipsFrame

        fun passtest() =
            (
                Main.compile "passtest/merge.tig";
                Main.compile "passtest/mergePrintList.tig";
                Main.compile "passtest/recordCompareTest.tig";
                Main.compile "passtest/intInputTest.tig";
                Main.compile "passtest/globalTest.tig";
                Main.compile "passtest/stringCompareTest.tig";
                Main.compile "passtest/TwoLetSL.tig";
                Main.compile "passtest/queens.tig";

                Main.compile "passtest/test1.tig";
                Main.compile "passtest/test2.tig";
                Main.compile "passtest/test3.tig";
                Main.compile "passtest/test4.tig";
                Main.compile "passtest/print.tig";
                Main.compile "passtest/while.tig";
                Main.compile "passtest/for.tig";
                Main.compile "passtest/testSL1.tig";
                Main.compile "passtest/testSL2.tig";

                Main.compile "passtest/queensPrintBoardWithBug.tig";
                Main.compile "passtest/queensPrintBoard.tig";
                Main.compile "passtest/queensAlmostDone.tig"
            )
        fun pass() =
            (
                Main.compile "pass/merge.tig";
                Main.compile "pass/queens.tig";
                Main.compile "pass/test1.tig";
                Main.compile "pass/test12.tig";
                Main.compile "pass/test2.tig";
                Main.compile "pass/test27.tig";
                Main.compile "pass/test3.tig";
                Main.compile "pass/test30.tig";
                Main.compile "pass/test37.tig";
                Main.compile "pass/test4.tig";
                Main.compile "pass/test41.tig";
                Main.compile "pass/test42.tig";
                Main.compile "pass/test44.tig";
                
                Main.compile "pass/test47.tig";
                
                Main.compile "pass/test5.tig";
                
                ()

                (*Correct Program but Not Pass*)
                (*Main.compile "pass/test46.tig";*)
                (*Main.compile "pass/test48.tig";*)
                (*Main.compile "pass/test6.tig";*)

                (*Main.compile "pass/test7.tig";*)
                (*Main.compile "pass/test8.tig";*)

            )

        fun file filename =
            let
                (*This affect the register assign!*)
                (*val () = Temp.clear()*)
            in
                print("\n===Processing: "^filename^"===\n");

                
                Main.compile filename
            end

          fun test1 () = 
            let
             fun test n = 
              if n = 50 then ()
              else 
                if n = 33 then test(n+1)
                else (
                 file("test/test"^Int.toString(n)^".tig");
                 test(n+1)
               ) 
          in
             file "test/merge.tig";
             file "test/queens.tig";

             test 1;
             print "***Test finish***\n"
         end

    fun print filename = PrintAbsyn.print(TextIO.openOut(filename^".t"), Parse.parse(filename))
end

