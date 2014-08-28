<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DRAGON_JTAG_TCK" />
        <signal name="DRAGON_JTAG_TDI" />
        <signal name="DRAGON_JTAG_TMS" />
        <signal name="ARD_JTAG_TDO" />
        <signal name="DRAGON_JTAG_TDO" />
        <signal name="ARD_JTAG_TCK" />
        <signal name="ARD_JTAG_TMS" />
        <signal name="ARD_JTAG_TDI" />
        <signal name="DRAGON_JTAG_GND" />
        <signal name="DRAGON_JTAG_GND2" />
        <signal name="DRAGON_JTAG_VTG" />
        <signal name="DRAGON_JTAG_RESET" />
        <signal name="ARD_RESET" />
        <port polarity="Input" name="DRAGON_JTAG_TCK" />
        <port polarity="Input" name="DRAGON_JTAG_TDI" />
        <port polarity="Input" name="DRAGON_JTAG_TMS" />
        <port polarity="Input" name="ARD_JTAG_TDO" />
        <port polarity="Output" name="DRAGON_JTAG_TDO" />
        <port polarity="Output" name="ARD_JTAG_TCK" />
        <port polarity="Output" name="ARD_JTAG_TMS" />
        <port polarity="Output" name="ARD_JTAG_TDI" />
        <port polarity="Output" name="DRAGON_JTAG_GND" />
        <port polarity="Output" name="DRAGON_JTAG_GND2" />
        <port polarity="Output" name="DRAGON_JTAG_VTG" />
        <port polarity="Input" name="DRAGON_JTAG_RESET" />
        <port polarity="Output" name="ARD_RESET" />
        <blockdef name="HappyJTAG2">
            <timestamp>2014-3-26T22:21:44</timestamp>
            <rect width="304" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="pullup">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-108" y2="-128" x1="64" />
            <line x2="64" y1="-104" y2="-108" x1="80" />
            <line x2="80" y1="-88" y2="-104" x1="48" />
            <line x2="48" y1="-72" y2="-88" x1="80" />
            <line x2="80" y1="-56" y2="-72" x1="48" />
            <line x2="48" y1="-48" y2="-56" x1="64" />
            <line x2="64" y1="-32" y2="-48" x1="64" />
            <line x2="64" y1="-56" y2="-48" x1="48" />
            <line x2="48" y1="-72" y2="-56" x1="80" />
            <line x2="80" y1="-88" y2="-72" x1="48" />
            <line x2="48" y1="-104" y2="-88" x1="80" />
            <line x2="80" y1="-108" y2="-104" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-128" y2="-128" x1="96" />
        </blockdef>
        <block symbolname="HappyJTAG2" name="XLXI_40">
            <blockpin signalname="DRAGON_JTAG_TCK" name="FT_TCK" />
            <blockpin signalname="DRAGON_JTAG_TDI" name="FT_MOSI" />
            <blockpin signalname="DRAGON_JTAG_TDO" name="FT_MISO" />
            <blockpin signalname="DRAGON_JTAG_TMS" name="FT_TMS" />
            <blockpin signalname="DRAGON_JTAG_RESET" name="FT_RESET" />
            <blockpin signalname="ARD_JTAG_TCK" name="AVR_TCK" />
            <blockpin signalname="ARD_JTAG_TDI" name="AVR_TDI" />
            <blockpin signalname="ARD_JTAG_TDO" name="AVR_TDO" />
            <blockpin signalname="ARD_JTAG_TMS" name="AVR_TMS" />
            <blockpin signalname="ARD_RESET" name="AVR_RESET" />
        </block>
        <block symbolname="gnd" name="XLXI_41">
            <blockpin signalname="DRAGON_JTAG_GND" name="G" />
        </block>
        <block symbolname="gnd" name="XLXI_43">
            <blockpin signalname="DRAGON_JTAG_GND2" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_42">
            <blockpin signalname="DRAGON_JTAG_VTG" name="P" />
        </block>
        <block symbolname="pullup" name="XLXI_52">
            <blockpin signalname="ARD_RESET" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="1856" y="1264" name="XLXI_40" orien="R0">
        </instance>
        <branch name="DRAGON_JTAG_TCK">
            <wire x2="1856" y1="976" y2="976" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="976" name="DRAGON_JTAG_TCK" orien="R180" />
        <branch name="DRAGON_JTAG_TDI">
            <wire x2="1856" y1="1040" y2="1040" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1040" name="DRAGON_JTAG_TDI" orien="R180" />
        <branch name="DRAGON_JTAG_TMS">
            <wire x2="1856" y1="1168" y2="1168" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1168" name="DRAGON_JTAG_TMS" orien="R180" />
        <branch name="ARD_JTAG_TDO">
            <wire x2="1856" y1="1104" y2="1104" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1104" name="ARD_JTAG_TDO" orien="R180" />
        <branch name="DRAGON_JTAG_TDO">
            <wire x2="2320" y1="1104" y2="1104" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1104" name="DRAGON_JTAG_TDO" orien="R0" />
        <branch name="ARD_JTAG_TCK">
            <wire x2="2320" y1="976" y2="976" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="976" name="ARD_JTAG_TCK" orien="R0" />
        <branch name="ARD_JTAG_TDI">
            <wire x2="2320" y1="1040" y2="1040" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1040" name="ARD_JTAG_TDI" orien="R0" />
        <branch name="ARD_JTAG_TMS">
            <wire x2="2320" y1="1168" y2="1168" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1168" name="ARD_JTAG_TMS" orien="R0" />
        <branch name="DRAGON_JTAG_GND">
            <wire x2="2208" y1="1696" y2="1744" x1="2208" />
        </branch>
        <instance x="2320" y="1872" name="XLXI_43" orien="R0" />
        <branch name="DRAGON_JTAG_GND2">
            <wire x2="2384" y1="1712" y2="1744" x1="2384" />
        </branch>
        <iomarker fontsize="28" x="2208" y="1696" name="DRAGON_JTAG_GND" orien="R270" />
        <iomarker fontsize="28" x="2384" y="1712" name="DRAGON_JTAG_GND2" orien="R270" />
        <instance x="1936" y="1440" name="XLXI_42" orien="R0" />
        <branch name="DRAGON_JTAG_VTG">
            <wire x2="2000" y1="1440" y2="1472" x1="2000" />
        </branch>
        <iomarker fontsize="28" x="2000" y="1472" name="DRAGON_JTAG_VTG" orien="R90" />
        <instance x="2144" y="1872" name="XLXI_41" orien="R0" />
        <branch name="DRAGON_JTAG_RESET">
            <wire x2="1840" y1="1232" y2="1232" x1="1824" />
            <wire x2="1856" y1="1232" y2="1232" x1="1840" />
        </branch>
        <branch name="ARD_RESET">
            <wire x2="2784" y1="1232" y2="1232" x1="2288" />
            <wire x2="2944" y1="1232" y2="1232" x1="2784" />
            <wire x2="2784" y1="1184" y2="1232" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2944" y="1232" name="ARD_RESET" orien="R0" />
        <iomarker fontsize="28" x="1824" y="1232" name="DRAGON_JTAG_RESET" orien="R180" />
        <instance x="2720" y="1184" name="XLXI_52" orien="R0" />
    </sheet>
</drawing>