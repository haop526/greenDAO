package ${schema.defaultJavaPackageDao};

import android.database.sqlite.SQLiteDatabase;

import java.util.Map;

import de.greenrobot.dao.AbstractDao;
import de.greenrobot.dao.DaoConfig;
import de.greenrobot.dao.AbstractDaoSession;
import de.greenrobot.dao.IdentityScopeType;

<#list schema.entities as entity>
import ${entity.javaPackageDao}.${entity.classNameDao};
</#list>

// THIS CODE IS GENERATED BY greenDAO, DO NOT EDIT.
/**
 * A DAO session is the main class you will interact with.
 */
public class DaoSession extends AbstractDaoSession {

<#list schema.entities as entity>
    private final DaoConfig ${entity.classNameDao?uncap_first}Config;
</#list>        

<#list schema.entities as entity>
    private final ${entity.classNameDao} ${entity.classNameDao?uncap_first};
</#list>        

    public DaoSession(SQLiteDatabase db, IdentityScopeType type, Map<Class<? extends AbstractDao<?, ?>>, DaoConfig>
            daoConfigMap) {
        super(db);

<#list schema.entities as entity>
        ${entity.classNameDao?uncap_first}Config = daoConfigMap.get(${entity.classNameDao}.class).clone();
        ${entity.classNameDao?uncap_first}Config.setIdentityScope(createIdentityScope(type));
</#list>        

<#list schema.entities as entity>
        ${entity.classNameDao?uncap_first} = new ${entity.classNameDao}<#--
-->(${entity.classNameDao?uncap_first}Config<#if entity.active>, this</#if>);
</#list>        

<#list schema.entities as entity>
        registerDao(${entity.className}.class, ${entity.classNameDao?uncap_first});
</#list>        
    }
    
    public void clear() {
<#list schema.entities as entity>
        ${entity.classNameDao?uncap_first}Config.getIdentityScope().clear();
</#list>    
    }

<#list schema.entities as entity>
    public ${entity.classNameDao} get${entity.classNameDao?cap_first}() {
        return ${entity.classNameDao?uncap_first};
    }

</#list>        
}
