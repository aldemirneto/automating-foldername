$path =  "C:\Users\aldemir.neto\Desktop\TEste"

cd "C:\Users\aldemir.neto\Desktop\teste"


$date = (Get-Date).toString('yyyy_MM_dd')





$pathde = $path + '\*'
#Exclue os arquivos com extensão .rem, .kev, .xyz
Get-ChildItem  *.rem -Recurse| foreach { Remove-Item -Path $_.FullName }
Get-ChildItem  *.xyz -Recurse| foreach { Remove-Item -Path $_.FullName }
Get-ChildItem  *.kev -Recurse| foreach { Remove-Item -Path $_.FullName }


#Search for files and folder with equal names and move the file into the folder
Get-ChildItem -path $path -Recurse -Directory|ForEach-Object{
    $Dir = $_.Name
    $Dirname = $_.BaseName
    $Diralvo = $_.FullName
    $parentpath = $_.Parent
    $Dirpath = $parentpath.FullName
       
    Get-ChildItem  -Path $Dirpath -File | ForEach-Object{
        $FileName = $_.BaseName
        $pathFile = $_.FullName
        if($DirName -eq $filename){
            Move-Item  $pathFile -Destination $Diralvo
            
        }
    }
}

#insert AL_ on the beginning of the name and  the actual date on the end of the folder name
Get-ChildItem -path $path -Recurse -Exclude AL_* -Directory| Rename-Item -NewName {'AL_' + $_.Name + '_' + $date}

#erase the extra spaces in a folder name
Get-ChildItem -path $path -Recurse| Rename-Item -NewName {$_.Name -replace "[' '\{]", ''}

#treatment of special characteres, such as -;, replacing them with _
Get-ChildItem -path $path -Recurse| Rename-Item -NewName {$_.Name -replace "[-;,$\{]", '_'}
