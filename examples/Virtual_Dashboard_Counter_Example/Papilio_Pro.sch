<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="XLXN_854" />
        <signal name="WING_AH6" />
        <signal name="WING_AH4" />
        <signal name="WING_AH2" />
        <signal name="WING_AH0" />
        <signal name="WING_AL6" />
        <signal name="WING_AL4" />
        <signal name="WING_AL2" />
        <signal name="WING_AL0" />
        <signal name="XLXN_863" />
        <signal name="rxd" />
        <signal name="txd" />
        <signal name="WING_AL1" />
        <port polarity="Input" name="clk" />
        <port polarity="BiDirectional" name="WING_AH6" />
        <port polarity="BiDirectional" name="WING_AH4" />
        <port polarity="BiDirectional" name="WING_AH2" />
        <port polarity="BiDirectional" name="WING_AH0" />
        <port polarity="BiDirectional" name="WING_AL6" />
        <port polarity="BiDirectional" name="WING_AL4" />
        <port polarity="BiDirectional" name="WING_AL2" />
        <port polarity="BiDirectional" name="WING_AL0" />
        <port polarity="Input" name="rxd" />
        <port polarity="Output" name="txd" />
        <port polarity="Output" name="WING_AL1" />
        <blockdef name="papilio_clocks">
            <timestamp>2014-4-30T16:36:2</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="Counter8">
            <timestamp>2014-4-30T21:2:6</timestamp>
            <rect width="256" x="64" y="-512" height="512" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="clk_divider_30to1hz">
            <timestamp>2014-4-30T20:16:33</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag">
            <timestamp>2014-4-30T21:0:31</timestamp>
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="272" x="64" y="-340" height="340" />
            <line x2="336" y1="-256" y2="-256" x1="400" />
            <line x2="336" y1="-224" y2="-224" x1="400" />
            <line x2="336" y1="-192" y2="-192" x1="400" />
            <line x2="336" y1="-160" y2="-160" x1="400" />
            <line x2="336" y1="-128" y2="-128" x1="400" />
            <line x2="336" y1="-96" y2="-96" x1="400" />
            <line x2="336" y1="-64" y2="-64" x1="400" />
            <line x2="336" y1="-32" y2="-32" x1="400" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
        </blockdef>
        <blockdef name="BENCHY_sa_SumpBlaze_LogicAnalyzer8">
            <timestamp>2013-12-19T5:51:42</timestamp>
            <rect width="384" x="64" y="-424" height="424" />
            <line x2="0" y1="-400" y2="-400" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="512" y1="-400" y2="-400" x1="448" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
        </blockdef>
        <block symbolname="papilio_clocks" name="XLXI_95">
            <blockpin signalname="clk" name="CLK" />
            <blockpin name="CLK_100Mhz" />
            <blockpin name="CLK_50Mhz" />
            <blockpin signalname="XLXN_863" name="CLK_32Mhz" />
            <blockpin name="CLK_25Mhz" />
            <blockpin name="CLK_10Mhz" />
            <blockpin name="CLK_8Mhz" />
        </block>
        <block symbolname="clk_divider_30to1hz" name="XLXI_99">
            <blockpin signalname="XLXN_863" name="clk_32Mhz" />
            <blockpin name="div19_30hz" />
            <blockpin name="div20_15hz" />
            <blockpin name="div21_8hz" />
            <blockpin name="div22_4hz" />
            <blockpin name="div23_2hz" />
            <blockpin signalname="XLXN_854" name="div24_1hz" />
        </block>
        <block symbolname="BENCHY_sa_SumpBlaze_LogicAnalyzer8_jtag" name="XLXI_111">
            <blockpin signalname="WING_AL0" name="led0" />
            <blockpin signalname="WING_AL2" name="led1" />
            <blockpin signalname="WING_AL4" name="led2" />
            <blockpin signalname="WING_AL6" name="led3" />
            <blockpin signalname="WING_AH0" name="led4" />
            <blockpin signalname="WING_AH2" name="led5" />
            <blockpin signalname="WING_AH4" name="led6" />
            <blockpin signalname="WING_AH6" name="led7" />
            <blockpin name="switch0" />
            <blockpin name="switch1" />
            <blockpin name="switch2" />
            <blockpin name="switch3" />
            <blockpin name="switch4" />
            <blockpin name="switch5" />
            <blockpin name="switch6" />
            <blockpin name="switch7" />
            <blockpin signalname="XLXN_863" name="clk_32Mhz" />
        </block>
        <block symbolname="BENCHY_sa_SumpBlaze_LogicAnalyzer8" name="XLXI_112">
            <blockpin signalname="XLXN_863" name="clk_32Mhz" />
            <blockpin signalname="WING_AL0" name="la0" />
            <blockpin signalname="rxd" name="rx" />
            <blockpin signalname="txd" name="tx" />
            <blockpin signalname="WING_AL2" name="la1" />
            <blockpin signalname="WING_AL4" name="la2" />
            <blockpin signalname="WING_AL6" name="la3" />
            <blockpin signalname="WING_AH0" name="la4" />
            <blockpin signalname="WING_AH2" name="la5" />
            <blockpin signalname="WING_AH4" name="la6" />
            <blockpin signalname="WING_AH6" name="la7" />
        </block>
        <block symbolname="Counter8" name="XLXI_113">
            <blockpin signalname="XLXN_854" name="clk" />
            <blockpin signalname="WING_AL0" name="count0" />
            <blockpin signalname="WING_AL2" name="count1" />
            <blockpin signalname="WING_AL4" name="count2" />
            <blockpin signalname="WING_AL6" name="count3" />
            <blockpin signalname="WING_AH0" name="count4" />
            <blockpin signalname="WING_AH2" name="count5" />
            <blockpin signalname="WING_AH4" name="count6" />
            <blockpin signalname="WING_AH6" name="count7" />
            <blockpin signalname="WING_AL1" name="reset" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="1072" y="1424" name="XLXI_95" orien="R0">
        </instance>
        <branch name="clk">
            <wire x2="1072" y1="1072" y2="1072" x1="1040" />
        </branch>
        <instance x="1552" y="1552" name="XLXI_99" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1040" y="1072" name="clk" orien="R180" />
        <branch name="XLXN_854">
            <wire x2="2000" y1="1520" y2="1520" x1="1984" />
            <wire x2="2016" y1="1520" y2="1520" x1="2000" />
        </branch>
        <branch name="WING_AH6">
            <wire x2="2768" y1="1968" y2="1968" x1="2400" />
            <wire x2="2848" y1="1968" y2="1968" x1="2768" />
            <wire x2="2768" y1="1968" y2="2576" x1="2768" />
            <wire x2="2944" y1="2576" y2="2576" x1="2768" />
            <wire x2="2800" y1="1328" y2="1328" x1="2768" />
            <wire x2="2768" y1="1328" y2="1968" x1="2768" />
        </branch>
        <branch name="WING_AH4">
            <wire x2="2720" y1="1904" y2="1904" x1="2400" />
            <wire x2="2720" y1="1904" y2="2544" x1="2720" />
            <wire x2="2944" y1="2544" y2="2544" x1="2720" />
            <wire x2="2848" y1="1904" y2="1904" x1="2720" />
            <wire x2="2800" y1="1296" y2="1296" x1="2720" />
            <wire x2="2720" y1="1296" y2="1904" x1="2720" />
        </branch>
        <branch name="WING_AH2">
            <wire x2="2672" y1="1840" y2="1840" x1="2400" />
            <wire x2="2672" y1="1840" y2="2512" x1="2672" />
            <wire x2="2944" y1="2512" y2="2512" x1="2672" />
            <wire x2="2848" y1="1840" y2="1840" x1="2672" />
            <wire x2="2800" y1="1264" y2="1264" x1="2672" />
            <wire x2="2672" y1="1264" y2="1840" x1="2672" />
        </branch>
        <branch name="WING_AH0">
            <wire x2="2624" y1="1776" y2="1776" x1="2400" />
            <wire x2="2624" y1="1776" y2="2480" x1="2624" />
            <wire x2="2944" y1="2480" y2="2480" x1="2624" />
            <wire x2="2848" y1="1776" y2="1776" x1="2624" />
            <wire x2="2800" y1="1232" y2="1232" x1="2624" />
            <wire x2="2624" y1="1232" y2="1776" x1="2624" />
        </branch>
        <branch name="WING_AL6">
            <wire x2="2576" y1="1712" y2="1712" x1="2400" />
            <wire x2="2576" y1="1712" y2="2448" x1="2576" />
            <wire x2="2944" y1="2448" y2="2448" x1="2576" />
            <wire x2="2848" y1="1712" y2="1712" x1="2576" />
            <wire x2="2800" y1="1200" y2="1200" x1="2576" />
            <wire x2="2576" y1="1200" y2="1712" x1="2576" />
        </branch>
        <branch name="WING_AL4">
            <wire x2="2544" y1="1648" y2="1648" x1="2400" />
            <wire x2="2544" y1="1648" y2="2416" x1="2544" />
            <wire x2="2944" y1="2416" y2="2416" x1="2544" />
            <wire x2="2848" y1="1648" y2="1648" x1="2544" />
            <wire x2="2800" y1="1168" y2="1168" x1="2544" />
            <wire x2="2544" y1="1168" y2="1648" x1="2544" />
        </branch>
        <branch name="WING_AL2">
            <wire x2="2496" y1="1584" y2="1584" x1="2400" />
            <wire x2="2496" y1="1584" y2="2384" x1="2496" />
            <wire x2="2944" y1="2384" y2="2384" x1="2496" />
            <wire x2="2848" y1="1584" y2="1584" x1="2496" />
            <wire x2="2800" y1="1136" y2="1136" x1="2496" />
            <wire x2="2496" y1="1136" y2="1584" x1="2496" />
        </branch>
        <branch name="WING_AL0">
            <wire x2="2448" y1="1520" y2="1520" x1="2400" />
            <wire x2="2448" y1="1520" y2="2352" x1="2448" />
            <wire x2="2944" y1="2352" y2="2352" x1="2448" />
            <wire x2="2848" y1="1520" y2="1520" x1="2448" />
            <wire x2="2800" y1="1104" y2="1104" x1="2448" />
            <wire x2="2448" y1="1104" y2="1520" x1="2448" />
        </branch>
        <iomarker fontsize="28" x="2848" y="1968" name="WING_AH6" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1904" name="WING_AH4" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1840" name="WING_AH2" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1776" name="WING_AH0" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1712" name="WING_AL6" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1648" name="WING_AL4" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1584" name="WING_AL2" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1520" name="WING_AL0" orien="R0" />
        <instance x="2800" y="1360" name="XLXI_111" orien="R0">
        </instance>
        <branch name="XLXN_863">
            <wire x2="1536" y1="1200" y2="1200" x1="1456" />
            <wire x2="1552" y1="1200" y2="1200" x1="1536" />
            <wire x2="1536" y1="1200" y2="2224" x1="1536" />
            <wire x2="2944" y1="2224" y2="2224" x1="1536" />
            <wire x2="1536" y1="1040" y2="1200" x1="1536" />
            <wire x2="2800" y1="1040" y2="1040" x1="1536" />
        </branch>
        <instance x="2944" y="2624" name="XLXI_112" orien="R0">
        </instance>
        <branch name="rxd">
            <wire x2="2944" y1="2288" y2="2288" x1="2912" />
        </branch>
        <iomarker fontsize="28" x="2912" y="2288" name="rxd" orien="R180" />
        <branch name="txd">
            <wire x2="3488" y1="2224" y2="2224" x1="3456" />
        </branch>
        <iomarker fontsize="28" x="3488" y="2224" name="txd" orien="R0" />
        <instance x="2016" y="2000" name="XLXI_113" orien="R0">
        </instance>
        <branch name="WING_AL1">
            <wire x2="2016" y1="1968" y2="1968" x1="1984" />
        </branch>
        <iomarker fontsize="28" x="1984" y="1968" name="WING_AL1" orien="R180" />
    </sheet>
</drawing>