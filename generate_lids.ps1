# Define the path to your .exe file
$openscad="C:\Program Files\OpenSCAD\openscad.exe"

# Create Directory
New-Item -ItemType Directory -Force -Path exports/lids

# Loop it
for ($x = 1; $x -le 6; $x++){
  for ($y = 1; $y -le 6; $y++){
    # Base Plate
    $filename="exports/lids/GridfinityLid_${x}_${y}.stl"
    & $openscad gridfinity_baseplate.scad -D xsize=${x} -D ysize=${y} -D lid=true -o $filename --export-format binstl
    While (!(Test-Path $filename -ErrorAction SilentlyContinue))
    {
        Start-Sleep -Seconds 1
    }
    Write-Host $filename
  }
}

