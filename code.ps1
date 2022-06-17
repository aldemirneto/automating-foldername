$path =  "C:\Users\55119\Desktop\TEste"

cd "C:\Users\55119\Desktop\TEste"


$date = (Get-Date).toString('yyyy_MM_dd')

#Get-ChildItem -Recurse -Exclude SB_* -Directory| Rename-Item -NewName {'SB_' + $_.Name + '_' + $date}
#Get-ChildItem -Recurse| Rename-Item -NewName {$_.Name -replace "[' '\{]", ''}
#Get-ChildItem -Recurse| Rename-Item -NewName {$_.Name -replace "[-;,$\{]", '_'}



$pathde = $path + '\*'
Get-ChildItem -Path $pathde -Exclude *.txt -File | Remove-Item


#PROCURA TODOS OS ARQUIVOS COM NOME IGUAL AO DE UMA PASTA E MOVE O ARQUIVO P ESSA PASTA
Get-ChildItem  -Recurse -Directory|ForEach-Object{
    $Dir = $_.Name
    $DirName = $_.BaseName
    $Dirpath = $_.FullName
    echo $Dirpath
    Get-ChildItem  -Path $Dirpath -File | ForEach-Object{
        $FileName = $_.BaseName
        $pathFile = $_.FullName
        if($DirNAme -eq $filename){
            echo 'achou'
            Move-Item  $pathFile -Destination $Dirpath
            
        }
    }
}

