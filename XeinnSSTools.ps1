Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

$toollar = @(
    [PSCustomObject]@{ Ad = "Everything";             Link = "https://www.voidtools.com/Everything-1.4.1.1032.x64-Setup.exe" },
    [PSCustomObject]@{ Ad = "System Informer";        Link = "https://sourceforge.net/projects/systeminformer/files/systeminformer-3.2.25011-release-setup.exe/download" },
    [PSCustomObject]@{ Ad = "Process Hacker";         Link = "https://sourceforge.net/projects/processhacker/files/latest/download" },
    [PSCustomObject]@{ Ad = "Shellbags View";         Link = "https://www.nirsoft.net/utils/shellbagsview.zip" },
    [PSCustomObject]@{ Ad = "WinDEF Log";             Link = "https://www.nirsoft.net/utils/windeflogview.zip" },
    [PSCustomObject]@{ Ad = "Uninstall View";         Link = "https://www.nirsoft.net/utils/uninstallview-x64.zip" },
    [PSCustomObject]@{ Ad = "Loaded DLLs View";       Link = "https://www.nirsoft.net/utils/loadeddllsview-x64.zip" },
    [PSCustomObject]@{ Ad = "WinPrefetchView";        Link = "https://www.nirsoft.net/utils/winprefetchview-x64.zip" },
    [PSCustomObject]@{ Ad = "InjGen";                 Link = "https://github.com/NotRequiem/InjGen/releases/download/v2.0/InjGen.exe" },
    [PSCustomObject]@{ Ad = "Red Lotus Mod Analyzer"; Link = "https://github.com/ItzIceHere/RedLotus-Mod-Analyzer/releases/download/RL/RedLotusModAnalyzer.exe" },
    [PSCustomObject]@{ Ad = "Luyten";                 Link = "https://github.com/deathmarine/Luyten/releases" },
    [PSCustomObject]@{ Ad = "User Assist";            Link = "https://dl.echo.ac/tool/userassist" },
    [PSCustomObject]@{ Ad = "Jumplist View";          Link = "https://www.nirsoft.net/utils/jumplistsview.zip" },
    [PSCustomObject]@{ Ad = "FTK Imager";             Link = "https://accessdata-ftk-imager.software.informer.com/download/?ca81189" },
    [PSCustomObject]@{ Ad = "Jarabel";                Link = "https://github.com/nay-cat/Jarabel/releases/download/light/Jarabel.Light.exe" },
    [PSCustomObject]@{ Ad = "Spoken Tool";            Link = "https://github.com/spokwn/Tool/releases/download/v1.1.2/espouken.exe" }
)

$muzikYol = "$env:TEMP\XeinnMuzik.mp3"
$muzikUrl = "https://raw.githubusercontent.com/Xeinn-Software/Xeinn-SS-Tools-Downloader/main/Engelsgesicht%20%26%20Skeptika%20-%20Yalim%20%5BuHY3Y9wNhek%5D.mp3"

if (-not (Test-Path $muzikYol)) {
    try {
        Invoke-WebRequest -Uri $muzikUrl -OutFile $muzikYol -UseBasicParsing -ErrorAction Stop
    } catch {
        $muzikYol = $null
    }
}

$mediaPlayer = $null
$script:sesAcik = $true

if ($muzikYol -and (Test-Path $muzikYol)) {
    $mediaPlayer = New-Object System.Windows.Media.MediaPlayer
    $mediaPlayer.Open([Uri]::new($muzikYol))
    $mediaPlayer.Volume = 0.5
    $mediaPlayer.Add_MediaEnded({
        $mediaPlayer.Position = [TimeSpan]::Zero
        $mediaPlayer.Play()
    })
    $mediaPlayer.Play()
}

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Xeinn SS Tools"
    Width="820" Height="640"
    MinWidth="620" MinHeight="400"
    WindowStartupLocation="CenterScreen"
    Background="#0A0A0A"
    FontFamily="Segoe UI">

    <Window.Resources>

        <Style x:Key="DownloadButon" TargetType="Button">
            <Setter Property="Background"      Value="#C0392B"/>
            <Setter Property="Foreground"      Value="#E8E8E8"/>
            <Setter Property="FontSize"        Value="12"/>
            <Setter Property="FontWeight"      Value="SemiBold"/>
            <Setter Property="Padding"         Value="18,0"/>
            <Setter Property="Height"          Value="34"/>
            <Setter Property="MinWidth"        Value="90"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor"          Value="Hand"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="bg" Background="{TemplateBinding Background}" CornerRadius="6" Padding="{TemplateBinding Padding}">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="bg" Property="Background" Value="#E74C3C"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="bg" Property="Background" Value="#922B21"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="AdButon" TargetType="Button">
            <Setter Property="Background"          Value="Transparent"/>
            <Setter Property="Foreground"          Value="#AAAAAA"/>
            <Setter Property="FontSize"            Value="13"/>
            <Setter Property="FontWeight"          Value="Medium"/>
            <Setter Property="BorderThickness"     Value="0"/>
            <Setter Property="Cursor"              Value="Hand"/>
            <Setter Property="HorizontalAlignment" Value="Left"/>
            <Setter Property="Padding"             Value="0"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <TextBlock x:Name="tb"
                                   Text="{TemplateBinding Content}"
                                   Foreground="{TemplateBinding Foreground}"
                                   FontSize="{TemplateBinding FontSize}"
                                   FontWeight="{TemplateBinding FontWeight}"/>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="tb" Property="Foreground"      Value="#E74C3C"/>
                                <Setter TargetName="tb" Property="TextDecorations" Value="Underline"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="tb" Property="Foreground" Value="#922B21"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="SesButon" TargetType="Button">
            <Setter Property="Background"      Value="#1A1A1A"/>
            <Setter Property="Foreground"      Value="#AAAAAA"/>
            <Setter Property="FontSize"        Value="12"/>
            <Setter Property="BorderBrush"     Value="#2A2A2A"/>
            <Setter Property="BorderThickness" Value="1"/>
            <Setter Property="Cursor"          Value="Hand"/>
            <Setter Property="Width"           Value="36"/>
            <Setter Property="Height"          Value="36"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <Border x:Name="bg"
                                Background="{TemplateBinding Background}"
                                BorderBrush="{TemplateBinding BorderBrush}"
                                BorderThickness="{TemplateBinding BorderThickness}"
                                CornerRadius="6">
                            <ContentPresenter HorizontalAlignment="Center" VerticalAlignment="Center"/>
                        </Border>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="bg" Property="Background"   Value="#2A0A0A"/>
                                <Setter TargetName="bg" Property="BorderBrush"  Value="#C0392B"/>
                                <Setter Property="Foreground"                   Value="#E74C3C"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="bg" Property="Background" Value="#111111"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="ScrollBar">
            <Setter Property="Width"      Value="6"/>
            <Setter Property="Background" Value="Transparent"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="ScrollBar">
                        <Grid>
                            <Track x:Name="PART_Track" IsDirectionReversed="True">
                                <Track.Thumb>
                                    <Thumb>
                                        <Thumb.Template>
                                            <ControlTemplate TargetType="Thumb">
                                                <Border Background="#3A0A0A" CornerRadius="3" Margin="1,0"/>
                                            </ControlTemplate>
                                        </Thumb.Template>
                                    </Thumb>
                                </Track.Thumb>
                            </Track>
                        </Grid>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

    </Window.Resources>

    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="50"/>
            <RowDefinition Height="70"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="38"/>
        </Grid.RowDefinitions>

        <!-- Baslik cubugu -->
        <Border Grid.Row="0" Background="#111111" BorderBrush="#2A0A0A" BorderThickness="0,0,0,1" Padding="20,0">
            <Grid>
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                    <TextBlock Text="Xeinn Tool" Foreground="#AAAAAA" FontSize="14" FontWeight="SemiBold" VerticalAlignment="Center"/>
                    <TextBlock Text="  —  Screen Share Download Tool" Foreground="#555555" FontSize="11" VerticalAlignment="Center"/>
                </StackPanel>
                <StackPanel Orientation="Horizontal" HorizontalAlignment="Right" VerticalAlignment="Center">
                    <TextBlock x:Name="kullaniciBilgi" Foreground="#444444" FontSize="11"
                               VerticalAlignment="Center" Margin="0,0,12,0"/>
                    <Button x:Name="sesButon" Content="VOL" Style="{StaticResource SesButon}" ToolTip="Sesi Kapat / Ac"/>
                </StackPanel>
            </Grid>
        </Border>

        <!-- XEINN SS TOOLS baslik -->
        <Border Grid.Row="1" Background="#0D0D0D" BorderBrush="#2A0A0A" BorderThickness="0,0,0,1">
            <TextBlock Text="X E I N N   S S   T O O L S"
                       Foreground="#C0392B"
                       FontSize="20"
                       FontWeight="Bold"
                       HorizontalAlignment="Center"
                       VerticalAlignment="Center"/>
        </Border>

        <!-- Scrollable tool listesi -->
        <ScrollViewer Grid.Row="2"
                      VerticalScrollBarVisibility="Auto"
                      HorizontalScrollBarVisibility="Disabled"
                      Padding="20,14,12,14"
                      Background="#0A0A0A">
            <StackPanel x:Name="anaPanel"/>
        </ScrollViewer>

        <!-- Alt durum cubugu -->
        <Border Grid.Row="3" Background="#111111" BorderBrush="#2A0A0A" BorderThickness="0,1,0,0" Padding="20,0">
            <Grid>
                <TextBlock x:Name="durumMetni" Text="Hazir"
                           Foreground="#444444" FontSize="11" VerticalAlignment="Center"/>
                <TextBlock x:Name="sayacMetni" Foreground="#444444" FontSize="11"
                           VerticalAlignment="Center" HorizontalAlignment="Right"/>
            </Grid>
        </Border>
    </Grid>
</Window>
"@

$reader  = New-Object System.Xml.XmlNodeReader $xaml
$pencere = [Windows.Markup.XamlReader]::Load($reader)

$anaPanel       = $pencere.FindName("anaPanel")
$durumMetni     = $pencere.FindName("durumMetni")
$sayacMetni     = $pencere.FindName("sayacMetni")
$kullaniciBilgi = $pencere.FindName("kullaniciBilgi")
$sesButon       = $pencere.FindName("sesButon")

$kullaniciBilgi.Text = "Kullanici: $env:USERNAME"
$sayacMetni.Text     = "$($toollar.Count) tool"

$sesButon.Add_Click({
    if ($mediaPlayer -eq $null) { return }
    if ($script:sesAcik) {
        $mediaPlayer.Volume  = 0
        $sesButon.Content    = "MUTE"
        $sesButon.Foreground = "#555555"
        $script:sesAcik      = $false
    } else {
        $mediaPlayer.Volume  = 0.5
        $sesButon.Content    = "VOL"
        $sesButon.Foreground = "#AAAAAA"
        $script:sesAcik      = $true
    }
})

$pencere.Add_Closed({
    if ($mediaPlayer -ne $null) {
        $mediaPlayer.Stop()
        $mediaPlayer.Close()
    }
})

function Yeni-ToolSatiri {
    param($ToolBilgisi, $Index)

    $bgRenk = if ($Index % 2 -eq 0) { "#111111" } else { "#0E0E0E" }

    $kart = New-Object System.Windows.Controls.Border
    $kart.Background      = $bgRenk
    $kart.CornerRadius    = "6"
    $kart.BorderBrush     = "#1E1E1E"
    $kart.BorderThickness = "1"
    $kart.Padding         = "16,11"
    $kart.Margin          = "0,0,6,5"

    $kart.Add_MouseEnter({ param($s,$e); $s.Background = "#1A0A0A"; $s.BorderBrush = "#C0392B" })
    $kart.Add_MouseLeave({ param($s,$e); $s.Background = $bgRenk;   $s.BorderBrush = "#1E1E1E" })

    $ic = New-Object System.Windows.Controls.Grid
    $c0 = New-Object System.Windows.Controls.ColumnDefinition; $c0.Width = "*"
    $c1 = New-Object System.Windows.Controls.ColumnDefinition; $c1.Width = "Auto"
    $ic.ColumnDefinitions.Add($c0)
    $ic.ColumnDefinitions.Add($c1)

    $solPanel = New-Object System.Windows.Controls.StackPanel
    $solPanel.VerticalAlignment = "Center"
    $solPanel.Margin = "0,0,16,0"

    $adButon = New-Object System.Windows.Controls.Button
    $adButon.Content = $ToolBilgisi.Ad
    $adButon.Style   = $pencere.Resources["AdButon"]
    $adButon.Tag     = $ToolBilgisi.Link

    $adButon.Add_Click({
        param($s, $e)
        try {
            Start-Process $s.Tag
            $durumMetni.Text       = "Acildi: $($s.Content)"
            $durumMetni.Foreground = "#C0392B"
        } catch {
            $durumMetni.Text       = "Hata: $($_.Exception.Message)"
            $durumMetni.Foreground = "#E74C3C"
        }
    })

    $linkMetni = New-Object System.Windows.Controls.TextBlock
    $linkMetni.Text         = $ToolBilgisi.Link
    $linkMetni.Foreground   = "#333333"
    $linkMetni.FontSize     = 10
    $linkMetni.FontFamily   = "Consolas"
    $linkMetni.Margin       = "0,3,0,0"
    $linkMetni.TextTrimming = "CharacterEllipsis"

    $solPanel.Children.Add($adButon)   | Out-Null
    $solPanel.Children.Add($linkMetni) | Out-Null

    $sagPanel = New-Object System.Windows.Controls.StackPanel
    $sagPanel.Orientation       = "Horizontal"
    $sagPanel.VerticalAlignment = "Center"

    $downloadButon = New-Object System.Windows.Controls.Button
    $downloadButon.Content = "Download"
    $downloadButon.Style   = $pencere.Resources["DownloadButon"]
    $downloadButon.ToolTip = "Indir"
    $downloadButon.Tag     = $ToolBilgisi.Link

    $downloadButon.Add_Click({
        param($s, $e)
        try {
            Start-Process $s.Tag
            $durumMetni.Text       = "Indiriliyor..."
            $durumMetni.Foreground = "#C0392B"
        } catch {
            $durumMetni.Text       = "Hata: $($_.Exception.Message)"
            $durumMetni.Foreground = "#E74C3C"
        }
    })

    $sagPanel.Children.Add($downloadButon) | Out-Null

    [System.Windows.Controls.Grid]::SetColumn($solPanel, 0)
    [System.Windows.Controls.Grid]::SetColumn($sagPanel, 1)
    $ic.Children.Add($solPanel) | Out-Null
    $ic.Children.Add($sagPanel) | Out-Null

    $kart.Child = $ic
    return $kart
}

for ($i = 0; $i -lt $toollar.Count; $i++) {
    $satir = Yeni-ToolSatiri -ToolBilgisi $toollar[$i] -Index $i
    $anaPanel.Children.Add($satir) | Out-Null
}

$pencere.ShowDialog() | Out-Null
