<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="LED" />
        <signal name="DRAM_DQM(1:0)" />
        <signal name="DRAM_BA(1:0)" />
        <signal name="DRAM_ADDR(12:0)" />
        <signal name="DRAM_WE_N" />
        <signal name="DRAM_RAS_N" />
        <signal name="DRAM_CS_N" />
        <signal name="DRAM_CLK" />
        <signal name="DRAM_CKE" />
        <signal name="DRAM_CAS_N" />
        <signal name="DRAM_DQ(15:0)" />
        <signal name="CLK" />
        <signal name="SPI_MISO" />
        <signal name="RXD" />
        <signal name="SPI_SCK" />
        <signal name="SPI_MOSI" />
        <signal name="TXD" />
        <signal name="SPI_CS" />
        <port polarity="Output" name="LED" />
        <port polarity="Output" name="DRAM_DQM(1:0)" />
        <port polarity="Output" name="DRAM_BA(1:0)" />
        <port polarity="Output" name="DRAM_ADDR(12:0)" />
        <port polarity="Output" name="DRAM_WE_N" />
        <port polarity="Output" name="DRAM_RAS_N" />
        <port polarity="Output" name="DRAM_CS_N" />
        <port polarity="Output" name="DRAM_CLK" />
        <port polarity="Output" name="DRAM_CKE" />
        <port polarity="Output" name="DRAM_CAS_N" />
        <port polarity="BiDirectional" name="DRAM_DQ(15:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="SPI_MISO" />
        <port polarity="Input" name="RXD" />
        <port polarity="Output" name="SPI_SCK" />
        <port polarity="Output" name="SPI_MOSI" />
        <port polarity="Output" name="TXD" />
        <port polarity="BiDirectional" name="SPI_CS" />
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="LED">
            <wire x2="752" y1="912" y2="912" x1="720" />
        </branch>
        <branch name="DRAM_DQM(1:0)">
            <wire x2="752" y1="848" y2="848" x1="720" />
        </branch>
        <branch name="DRAM_BA(1:0)">
            <wire x2="752" y1="816" y2="816" x1="720" />
        </branch>
        <branch name="DRAM_ADDR(12:0)">
            <wire x2="752" y1="784" y2="784" x1="720" />
        </branch>
        <branch name="DRAM_WE_N">
            <wire x2="752" y1="752" y2="752" x1="720" />
        </branch>
        <branch name="DRAM_RAS_N">
            <wire x2="752" y1="720" y2="720" x1="720" />
        </branch>
        <branch name="DRAM_CS_N">
            <wire x2="752" y1="688" y2="688" x1="720" />
        </branch>
        <branch name="DRAM_CLK">
            <wire x2="752" y1="656" y2="656" x1="720" />
        </branch>
        <branch name="DRAM_CKE">
            <wire x2="752" y1="624" y2="624" x1="720" />
        </branch>
        <branch name="DRAM_CAS_N">
            <wire x2="752" y1="592" y2="592" x1="720" />
        </branch>
        <branch name="DRAM_DQ(15:0)">
            <wire x2="752" y1="560" y2="560" x1="720" />
        </branch>
        <branch name="CLK">
            <wire x2="752" y1="336" y2="336" x1="720" />
        </branch>
        <branch name="SPI_MISO">
            <wire x2="752" y1="400" y2="400" x1="720" />
        </branch>
        <branch name="RXD">
            <wire x2="752" y1="464" y2="464" x1="720" />
        </branch>
        <iomarker fontsize="28" x="720" y="912" name="LED" orien="R180" />
        <iomarker fontsize="28" x="720" y="848" name="DRAM_DQM(1:0)" orien="R180" />
        <iomarker fontsize="28" x="720" y="816" name="DRAM_BA(1:0)" orien="R180" />
        <iomarker fontsize="28" x="720" y="784" name="DRAM_ADDR(12:0)" orien="R180" />
        <iomarker fontsize="28" x="720" y="752" name="DRAM_WE_N" orien="R180" />
        <iomarker fontsize="28" x="720" y="720" name="DRAM_RAS_N" orien="R180" />
        <iomarker fontsize="28" x="720" y="688" name="DRAM_CS_N" orien="R180" />
        <iomarker fontsize="28" x="720" y="656" name="DRAM_CLK" orien="R180" />
        <iomarker fontsize="28" x="720" y="624" name="DRAM_CKE" orien="R180" />
        <iomarker fontsize="28" x="720" y="592" name="DRAM_CAS_N" orien="R180" />
        <iomarker fontsize="28" x="720" y="560" name="DRAM_DQ(15:0)" orien="R180" />
        <iomarker fontsize="28" x="720" y="336" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="720" y="400" name="SPI_MISO" orien="R180" />
        <iomarker fontsize="28" x="720" y="464" name="RXD" orien="R180" />
        <branch name="SPI_SCK">
            <wire x2="2384" y1="512" y2="512" x1="2352" />
        </branch>
        <branch name="SPI_MOSI">
            <wire x2="2384" y1="544" y2="544" x1="2352" />
        </branch>
        <branch name="TXD">
            <wire x2="2384" y1="576" y2="576" x1="2352" />
        </branch>
        <branch name="SPI_CS">
            <wire x2="2384" y1="608" y2="608" x1="2352" />
        </branch>
        <iomarker fontsize="28" x="2384" y="512" name="SPI_SCK" orien="R0" />
        <iomarker fontsize="28" x="2384" y="544" name="SPI_MOSI" orien="R0" />
        <iomarker fontsize="28" x="2384" y="576" name="TXD" orien="R0" />
        <iomarker fontsize="28" x="2384" y="608" name="SPI_CS" orien="R0" />
        <rect width="728" x="256" y="240" height="848" />
        <text style="fontsize:40;fontname:Arial" x="296" y="1048">Left Side Connections for Papilio Pro</text>
        <rect width="620" x="2232" y="404" height="376" />
        <text style="fontsize:40;fontname:Arial" x="2272" y="708">Right Side Connections for all</text>
    </sheet>
</drawing>