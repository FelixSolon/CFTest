<!DOCTYPE html>
<html>
<head>
    <title></title>
    <link rel="stylesheet" type="text/css" href="./assets/style.css" />
</head>
<body>
    <header>
        aasdfasdf
    </header>
    <section>
        <cftry>
        <cfoutput>
            <!--- Find current location --->
            <cfset strPath = ExpandPath("./") />

            <!--- Find all .cfc files --->
            <cfdirectory directory="#strpath#" name="dirQuery" action="list" filter="*.cfc" recurse="yes" />
            <cfdump var="#dirQuery#" />
            <!--- Find the relative folder ---> 
            <cfset foundComponents = [] />
            <cfdump var=#strPath# />
            <cfset pwdStrPath=Left(strPath, len(strPath)-1) />
            <cfdump var=#pwdStrPath# />
            <cfloop query="#dirQuery#">
                <cfset replacedPath=Replace(#dirQuery.Directory#, strPath, "") />
                <cfset replacedPath=Replace(#dirQuery.Directory#, pwdStrPath, "") />
                <cfif len(replacedPath) neq 0>
                    <cfset replacedPath = "#replacedPath#." />
                </cfif>
                <cfset replacedFileName=Replace(#dirQuery.Name#, ".cfc", "") />

                
                <cfset arrayAppend(foundComponents, "#replacedPath##replacedFileName#") />
            </cfloop>
            <cfdump var=#foundComponents# />
            <cfset foundMethods = [] />
            <cfloop index="i" from="1" to="#arrayLen(foundComponents)#">
                <cfset tempStruct = {"component": foundComponents[i], "methods": GetComponentMetaData(foundComponents[i]).functions} />
                <cfset arrayAppend(foundMethods, tempStruct) />
            </cfloop>
            <cfdump var=#foundMethods# />
            <form>
                <input type="hidden" name="submitted" value="1">
                <select>
                    <cfoutput>
                        <cfloop index="i" from="1" to="#arrayLen(foundMethods)#">
                            <option value="#foundMethods[i].component#">#foundMethods[i].component#</option>
                        </cfloop>
                    </cfoutput>
                </select>
            </form>
        </cfoutput>
        <cfcatch>
            <cfdump var=#cfcatch# />
        </cfcatch>
    </cftry>
    </section>
    <footer>
        Bye
    </footer>
</body>
<script type="text/javascript" src="./assets/javascript.js" />
</html>