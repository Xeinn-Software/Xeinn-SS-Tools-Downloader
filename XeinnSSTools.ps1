Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase

$toollar = @(
    [PSCustomObject]@{ Ad = "Everything";               Link = "https://www.voidtools.com/Everything-1.4.1.1032.x64-Setup.exe" },
    [PSCustomObject]@{ Ad = "System Informer";          Link = "https://sourceforge.net/projects/systeminformer/files/systeminformer-3.2.25011-release-setup.exe/download" },
    [PSCustomObject]@{ Ad = "Process Hacker";           Link = "https://sourceforge.net/projects/processhacker/files/latest/download" },
    [PSCustomObject]@{ Ad = "Shellbags View";           Link = "https://www.nirsoft.net/utils/shellbagsview.zip" },
    [PSCustomObject]@{ Ad = "WinDEF Log";               Link = "https://www.nirsoft.net/utils/windeflogview.zip" },
    [PSCustomObject]@{ Ad = "Uninstall View";           Link = "https://www.nirsoft.net/utils/uninstallview-x64.zip" },
    [PSCustomObject]@{ Ad = "Loaded DLLs View";         Link = "https://www.nirsoft.net/utils/loadeddllsview-x64.zip" },
    [PSCustomObject]@{ Ad = "WinPrefetchView";          Link = "https://www.nirsoft.net/utils/winprefetchview-x64.zip" },
    [PSCustomObject]@{ Ad = "InjGen";                   Link = "https://github.com/NotRequiem/InjGen/releases/download/v2.0/InjGen.exe" },
    [PSCustomObject]@{ Ad = "Red Lotus Mod Analyzer";   Link = "https://github.com/ItzIceHere/RedLotus-Mod-Analyzer/releases/download/RL/RedLotusModAnalyzer.exe" },
    [PSCustomObject]@{ Ad = "Luyten";                   Link = "https://github.com/deathmarine/Luyten/releases" },
    [PSCustomObject]@{ Ad = "User Assist";              Link = "https://dl.echo.ac/tool/userassist" },
    [PSCustomObject]@{ Ad = "Jumplist View";            Link = "https://www.nirsoft.net/utils/jumplistsview.zip" },
    [PSCustomObject]@{ Ad = "FTK Imager";               Link = "https://accessdata-ftk-imager.software.informer.com/download/?ca81189" },
    [PSCustomObject]@{ Ad = "Path Duzenleyici";         Link = "https://github.com/trSScommunity/PathDuzenleyiciV2/raw/refs/heads/main/PathDuzenleyicisiV2.exe" },
    [PSCustomObject]@{ Ad = "Jarabel";                  Link = "https://github.com/nay-cat/Jarabel/releases/download/light/Jarabel.Light.exe" },
    [PSCustomObject]@{ Ad = "Spoken Tool";              Link = "https://github.com/spokwn/Tool/releases/download/v1.1.2/espouken.exe" }
)

[xml]$xaml = @"
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="Xeinn SS Tools"
    Width="820" Height="640"
    MinWidth="620" MinHeight="400"
    WindowStartupLocation="CenterScreen"
    Background="#1A1D23"
    FontFamily="Segoe UI">

    <Window.Resources>

        <Style x:Key="DownloadButon" TargetType="Button">
            <Setter Property="Background"      Value="#2D6BE4"/>
            <Setter Property="Foreground"      Value="#FFFFFF"/>
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
                                <Setter TargetName="bg" Property="Background" Value="#3D7BF4"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="bg" Property="Background" Value="#1D5BD4"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style x:Key="AdButon" TargetType="Button">
            <Setter Property="Background"      Value="Transparent"/>
            <Setter Property="Foreground"      Value="#D0D6E0"/>
            <Setter Property="FontSize"        Value="13"/>
            <Setter Property="FontWeight"      Value="Medium"/>
            <Setter Property="BorderThickness" Value="0"/>
            <Setter Property="Cursor"          Value="Hand"/>
            <Setter Property="HorizontalAlignment" Value="Left"/>
            <Setter Property="Padding"         Value="0"/>
            <Setter Property="Template">
                <Setter.Value>
                    <ControlTemplate TargetType="Button">
                        <TextBlock x:Name="tb"
                                   Text="{TemplateBinding Content}"
                                   Foreground="{TemplateBinding Foreground}"
                                   FontSize="{TemplateBinding FontSize}"
                                   FontWeight="{TemplateBinding FontWeight}"
                                   TextDecorations="None"/>
                        <ControlTemplate.Triggers>
                            <Trigger Property="IsMouseOver" Value="True">
                                <Setter TargetName="tb" Property="Foreground" Value="#5B9EF8"/>
                                <Setter TargetName="tb" Property="TextDecorations" Value="Underline"/>
                            </Trigger>
                            <Trigger Property="IsPressed" Value="True">
                                <Setter TargetName="tb" Property="Foreground" Value="#2D6BE4"/>
                            </Trigger>
                        </ControlTemplate.Triggers>
                    </ControlTemplate>
                </Setter.Value>
            </Setter>
        </Style>

        <Style TargetType="ScrollBar">
            <Setter Property="Width"      Value="8"/>
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
                                                <Border Background="#3D4251" CornerRadius="4" Margin="2,0"/>
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
            <RowDefinition Height="56"/>
            <RowDefinition Height="80"/>
            <RowDefinition Height="*"/>
            <RowDefinition Height="40"/>
        </Grid.RowDefinitions>

        <!-- Baslik cubugu -->
        <Border Grid.Row="0" Background="#21242D" BorderBrush="#2D3140" BorderThickness="0,0,0,1" Padding="24,0">
            <Grid>
                <StackPanel Orientation="Horizontal" VerticalAlignment="Center">
                    <Border Background="#2D6BE4" CornerRadius="6" Width="28" Height="28" Margin="0,0,12,0">
                        <TextBlock Text="X" Foreground="White" FontSize="14" FontWeight="Bold"
                                   HorizontalAlignment="Center" VerticalAlignment="Center"/>
                    </Border>
                    <StackPanel VerticalAlignment="Center">
                        <TextBlock Text="Xeinn Tool" Foreground="#E8ECF4" FontSize="15" FontWeight="SemiBold"/>
                        <TextBlock Text="Screen Share Download Tool" Foreground="#5A6070" FontSize="11"/>
                    </StackPanel>
                </StackPanel>
                <TextBlock x:Name="kullaniciBilgi" Foreground="#4A5060" FontSize="11"
                           VerticalAlignment="Center" HorizontalAlignment="Right" Margin="0,0,8,0"/>
            </Grid>
        </Border>

        <!-- Orta baslik: XEINN SS TOOLS -->
        <Border Grid.Row="1" Background="#1E2229" BorderBrush="#2D3140" BorderThickness="0,0,0,1">
            <TextBlock Text="XEINN SS TOOLS"
                       Foreground="#2D6BE4"
                       FontSize="22"
                       FontWeight="Bold"
                       FontFamily="Segoe UI"
                       HorizontalAlignment="Center"
                       VerticalAlignment="Center"
                       LetterSpacing="6"/>
        </Border>

        <!-- Scrollable tool listesi -->
        <ScrollViewer Grid.Row="2"
                      VerticalScrollBarVisibility="Auto"
                      HorizontalScrollBarVisibility="Disabled"
                      Padding="24,16,16,16"
                      Background="#1A1D23">
            <StackPanel x:Name="anaPanel"/>
        </ScrollViewer>

        <!-- Alt durum cubugu -->
        <Border Grid.Row="3" Background="#21242D" BorderBrush="#2D3140" BorderThickness="0,1,0,0" Padding="24,0">
            <Grid>
                <TextBlock x:Name="durumMetni" Text="Hazir - Bir tool seciniz"
                           Foreground="#4A5060" FontSize="11" VerticalAlignment="Center"/>
                <TextBlock x:Name="sayacMetni" Foreground="#4A5060" FontSize="11"
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

$kullaniciBilgi.Text = "Kullanici: $env:USERNAME"
$sayacMetni.Text     = "$($toollar.Count) tool yuklendi"

function Yeni-ToolSatiri {
    param($ToolBilgisi, $Index)

    $bgRenk = if ($Index % 2 -eq 0) { "#21242D" } else { "#1E2229" }

    $kart = New-Object System.Windows.Controls.Border
    $kart.Background      = $bgRenk
    $kart.CornerRadius    = "8"
    $kart.BorderBrush     = "#2D3140"
    $kart.BorderThickness = "1"
    $kart.Padding         = "16,12"
    $kart.Margin          = "0,0,8,6"

    $kart.Add_MouseEnter({ param($s,$e); $s.Background = "#262A35"; $s.BorderBrush = "#3D6BE0" })
    $kart.Add_MouseLeave({ param($s,$e); $s.Background = $bgRenk;   $s.BorderBrush = "#2D3140" })

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
            $durumMetni.Foreground = "#4CAF50"
        } catch {
            $durumMetni.Text       = "Hata: $($_.Exception.Message)"
            $durumMetni.Foreground = "#EF5350"
        }
    })

    $linkMetni = New-Object System.Windows.Controls.TextBlock
    $linkMetni.Text         = $ToolBilgisi.Link
    $linkMetni.Foreground   = "#3A3F4B"
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
    $downloadButon.ToolTip = "Tarayicida indir"
    $downloadButon.Tag     = $ToolBilgisi.Link

    $downloadButon.Add_Click({
        param($s, $e)
        try {
            Start-Process $s.Tag
            $durumMetni.Text       = "Indiriliyor: $($s.Tag)"
            $durumMetni.Foreground = "#4CAF50"
        } catch {
            $durumMetni.Text       = "Hata: $($_.Exception.Message)"
            $durumMetni.Foreground = "#EF5350"
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
