<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="DRAGON_SPI_SCK" />
        <signal name="DRAGON_SPI_MOSI" />
        <signal name="WING_BL2" />
        <signal name="DRAGON_SPI_RESET" />
        <signal name="ARD_SPI_MISO" />
        <signal name="DRAGON_SPI_MISO" />
        <signal name="ARD_SPI_SCLK" />
        <signal name="ARD_TMS" />
        <signal name="ARD_RESET" />
        <signal name="ARD_SPI_MOSI" />
        <signal name="DRAGON_SPI_VTG" />
        <signal name="DRAGON_SPI_GND" />
        <port polarity="Input" name="DRAGON_SPI_SCK" />
        <port polarity="Input" name="DRAGON_SPI_MOSI" />
        <port polarity="Input" name="WING_BL2" />
        <port polarity="Input" name="DRAGON_SPI_RESET" />
        <port polarity="Input" name="ARD_SPI_MISO" />
        <port polarity="Output" name="DRAGON_SPI_MISO" />
        <port polarity="Output" name="ARD_SPI_SCLK" />
        <port polarity="Output" name="ARD_TMS" />
        <port polarity="Output" name="ARD_RESET" />
        <port polarity="Output" name="ARD_SPI_MOSI" />
        <port polarity="Output" name="DRAGON_SPI_VTG" />
        <port polarity="Output" name="DRAGON_SPI_GND" />
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
        <block symbolname="HappyJTAG2" name="XLXI_40">
            <blockpin signalname="DRAGON_SPI_SCK" name="FT_TCK" />
            <blockpin signalname="DRAGON_SPI_MOSI" name="FT_MOSI" />
            <blockpin signalname="DRAGON_SPI_MISO" name="FT_MISO" />
            <blockpin signalname="WING_BL2" name="FT_TMS" />
            <blockpin signalname="DRAGON_SPI_RESET" name="FT_RESET" />
            <blockpin signalname="ARD_SPI_SCLK" name="AVR_TCK" />
            <blockpin signalname="ARD_SPI_MOSI" name="AVR_TDI" />
            <blockpin signalname="ARD_SPI_MISO" name="AVR_TDO" />
            <blockpin signalname="ARD_TMS" name="AVR_TMS" />
            <blockpin signalname="ARD_RESET" name="AVR_RESET" />
        </block>
        <block symbolname="vcc" name="XLXI_42">
            <blockpin signalname="DRAGON_SPI_VTG" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_41">
            <blockpin signalname="DRAGON_SPI_GND" name="G" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="5440" height="3520">
        <instance x="1856" y="1264" name="XLXI_40" orien="R0">
        </instance>
        <branch name="DRAGON_SPI_SCK">
            <wire x2="1856" y1="976" y2="976" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="976" name="DRAGON_SPI_SCK" orien="R180" />
        <branch name="DRAGON_SPI_MOSI">
            <wire x2="1856" y1="1040" y2="1040" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1040" name="DRAGON_SPI_MOSI" orien="R180" />
        <branch name="WING_BL2">
            <wire x2="1856" y1="1168" y2="1168" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1168" name="WING_BL2" orien="R180" />
        <branch name="DRAGON_SPI_RESET">
            <wire x2="1856" y1="1232" y2="1232" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1232" name="DRAGON_SPI_RESET" orien="R180" />
        <branch name="ARD_SPI_MISO">
            <wire x2="1856" y1="1104" y2="1104" x1="1824" />
        </branch>
        <iomarker fontsize="28" x="1824" y="1104" name="ARD_SPI_MISO" orien="R180" />
        <branch name="DRAGON_SPI_MISO">
            <wire x2="2320" y1="1104" y2="1104" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1104" name="DRAGON_SPI_MISO" orien="R0" />
        <branch name="ARD_SPI_SCLK">
            <wire x2="2320" y1="976" y2="976" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="976" name="ARD_SPI_SCLK" orien="R0" />
        <branch name="ARD_SPI_MOSI">
            <wire x2="2320" y1="1040" y2="1040" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1040" name="ARD_SPI_MOSI" orien="R0" />
        <branch name="ARD_TMS">
            <wire x2="2320" y1="1168" y2="1168" x1="2288" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1168" name="ARD_TMS" orien="R0" />
        <instance x="2720" y="1376" name="XLXI_42" orien="R0" />
        <branch name="DRAGON_SPI_VTG">
            <wire x2="2784" y1="1376" y2="1408" x1="2784" />
        </branch>
        <iomarker fontsize="28" x="2784" y="1408" name="DRAGON_SPI_VTG" orien="R90" />
        <branch name="ARD_RESET">
            <wire x2="2304" y1="1232" y2="1232" x1="2288" />
            <wire x2="2320" y1="1232" y2="1232" x1="2304" />
        </branch>
        <iomarker fontsize="28" x="2320" y="1232" name="ARD_RESET" orien="R0" />
        <instance x="2928" y="1584" name="XLXI_41" orien="R0" />
        <branch name="DRAGON_SPI_GND">
            <wire x2="2992" y1="1424" y2="1456" x1="2992" />
        </branch>
        <iomarker fontsize="28" x="2992" y="1424" name="DRAGON_SPI_GND" orien="R270" />
    </sheet>
</drawing>