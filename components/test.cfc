<cfcomponent>
    <cffunction access="public" returnType="any" name="aaaaaaaaaaaaaaaaaaaaaaaaaaaa">
        <cfargument type="string" name="stringArgument" />
        <cfreturn "Hi!" />
    </cffunction>

    <cffunction access="private" returnType="string" name="bar">
        <cfargument type="numeric" name="numberArgument" />
        <cfreturn "Really?" />
    </cffunction>
</cfcomponent>