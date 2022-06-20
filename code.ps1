$path =  "C:\Users\aldemir.neto\Desktop\TEste"

cd "C:\Users\aldemir.neto\Desktop\teste"


$date = (Get-Date).toString('yyyy_MM_dd')





$pathde = $path + '\*'
Get-ChildItem  *.rem -Recurse| foreach { Remove-Item -Path $_.FullName }
Get-ChildItem  *.xyz -Recurse| foreach { Remove-Item -Path $_.FullName }
Get-ChildItem  *.kev -Recurse| foreach { Remove-Item -Path $_.FullName }


#PROCURA TODOS OS ARQUIVOS COM NOME IGUAL AO DE UMA PASTA E MOVE O ARQUIVO P ESSA PASTA
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
Get-ChildItem -path $path -Recurse -Exclude SB_* -Directory| Rename-Item -NewName {'SB_' + $_.Name + '_' + $date}
Get-ChildItem -path $path -Recurse| Rename-Item -NewName {$_.Name -replace "[' '\{]", ''}
Get-ChildItem -path $path -Recurse| Rename-Item -NewName {$_.Name -replace "[-;,$\{]", '_'}
