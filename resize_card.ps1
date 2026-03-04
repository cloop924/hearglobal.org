Add-Type -AssemblyName System.Drawing

$sourcePath = ".\images raw\card_12.jpg"
$destPath = ".\cards\card_12.jpg"

if (Test-Path $destPath) {
    Remove-Item $destPath
}

$img = [System.Drawing.Image]::FromFile($sourcePath)
$newWidth = 400
$newHeight = [math]::Round($img.Height * ($newWidth / $img.Width))

$bmp = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
$g = [System.Drawing.Graphics]::FromImage($bmp)

# High quality resizing
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
$g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
$g.CompositingQuality = [System.Drawing.Drawing2D.CompositingQuality]::HighQuality

$g.DrawImage($img, 0, 0, $newWidth, $newHeight)

# Save with good JPEG quality
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
$encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, 90)

$bmp.Save($destPath, $encoder, $encoderParams)

$g.Dispose()
$bmp.Dispose()
$img.Dispose()

Write-Host "Successfully resized card_12.jpg"
