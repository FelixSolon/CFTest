<cfcomponent>
    <cffunction access="public" returnType="any" name="questionable">
        <cfargument type="string" name="stringArgument" />
        <cfreturn "Hi!" />
    </cffunction>

    <cffunction access="private" returnType="string" name="content">
        <cfargument type="any" name="numberArgument" />
        <cfreturn "Really?" />
    </cffunction>
</cfcomponent>