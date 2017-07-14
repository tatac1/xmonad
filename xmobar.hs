--
-- .xmobarrc
--

Config { font = "xft:Source Han Sans JP Normal-10"
       , bgColor = "black"
       , fgColor = "green"
       , position = Top
       , lowerOnStart = False
       , commands = [
                    Run Weather "KPAO" ["-t","<tempC>.C <skyCondition>","-L","64","-H","77","-n","#CEFFAC","-h","#FFB6B0","-l","#96CBFE"] 36000,
                    Run MultiCpu ["-t","Cpu: <total0> <total1> <total2> <total3>","-L","30","-H","60","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC","-w","3"] 10,
                    Run Memory ["-t","Mem: <usedratio>%","-H","8192","-L","4096","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
                    Run Swap ["-t","Swap: <usedratio>%","-H","1024","-L","512","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
                    Run Network "wls1" ["-t","Net: <rx>, <tx>","-H","200","-L","10","-h","#FFB6B0","-l","#CEFFAC","-n","#FFFFCC"] 10,
                    Run Date "%a %b %_d %l:%M" "date" 10,
                    Run Battery ["-t", "<acstatus><watts> (<left>%)","-L", "10", "-H", "80", "-p", "3","--", "-O", "<fc=green>On</fc> - ", "-i", "","-L", "-15", "-H", "-5","-l", "red", "-m", "blue", "-h", "green"] 60,
                    Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = "%StdinReader% }{ %battery%   %multicpu%   %memory%   %swap%   %wls1%   <fc=#FFFFCC>%date%</fc>  "
       }
