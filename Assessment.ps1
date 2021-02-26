function Get-FirstRepeatingCharInAString {
    <#
        .SYNOPSIS
            Returns first occurence of a repeat character in a string
        .DESCRIPTION
            Finds the first occurance of a repeated character of a given string.    
        .PARAMETER Foo
            TYPE STRING
        .INPUTS
            Takes a string value from a pipeline
        .OUTPUTS
            Returns a single character
        .EXAMPLE
            Get-FirstRepeatingCharInAString -Foo "abcdefgabcdefg"
        .EXAMPLE
            "abcdefgabcdefg" | Get-FirstRepeatingCharInAString               
    #>
    [CmdletBinding()]
    param (

        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [ValidatePattern('^[a-zA-Z]+$')]
        [string]
        $Foo
    )

    begin {
        $found = $null
        $hash = [ordered]@{}
    }

    process {
        $bar = $foo.ToCharArray()

        $hash.Add(0,$bar[0])
        for ($i = 1; $i -lt $bar.Count; $i++) {
            if ($bar[$i] -in $hash.Values) {
                $found = $bar[$i]
                break
            }
            else {
               $hash.Add($i,$bar[$i]) 
            }
        }
        if (-not($found)) {
                $found = "No repeating characters found"
            }
        return $found    
    }
    
    end {
        
    }
}
