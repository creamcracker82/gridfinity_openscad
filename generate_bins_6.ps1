# Define the path to your .exe file
$openscad="C:\Program Files\OpenSCAD\openscad.exe"

# Create Directory
New-Item -ItemType Directory -Force -Path exports/storebins6

# Loop it
for ($x = 1; $x -le 6; $x=$x+0.5){
  for ($y = 1; $y -le 6; $y=$y+0.5){
    # Height 6
    $filename="exports/storebins6/store_bin_${x}_${y}_6.stl"
    & $openscad gridfinity_basic_cup.scad -D width=${x} -D depth=${y} -D height=6 -D withLabel="center" -o $filename --export-format binstl
    While (!(Test-Path $filename -ErrorAction SilentlyContinue))
    {
        Start-Sleep -Seconds 1
    }
    Write-Host $filename
  }
}

