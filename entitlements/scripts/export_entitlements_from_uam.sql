SELECT DISTINCT
  LD.LDAP_GROUP_NAME AS LDAP_GROUPS,
  R.NAME AS ROLES,
  EG.NAME AS ENTITLEMENTS_GROUPS,
  E.NAME AS ENTITLEMENTS

FROM
  UAM_LDAP_GROUP LD,
  UAM_LDAP_GROUP_ROLES LDR,
  UAM_ROLE R,
  UAM_ENT_GROUP_ROLES EGR,
  UAM_ENTITLEMENT_GROUP EG,
  UAM_ENT_GROUP_ENTITLEMENTS EGE,
  UAM_ENTITLEMENT E

WHERE
  LD.ID = LDR.LDAP_GROUP_ID
  AND LDR.ROLE_ID = R.ID
  AND R.ID = EGR.ROLE_ID
  AND EGR.ENTITLEMENT_GROUP_ID = EG.ID
  AND EG.ID = EGE.ENTITLEMENT_GROUP_ID
  AND EGE.ENTITLEMENT_ID = E.ID

GROUP BY
  LD.LDAP_GROUP_NAME,
  R.NAME,
  EG.NAME,
  E.NAME

ORDER BY
  LD.LDAP_GROUP_NAME,
  R.NAME,
  EG.NAME,
  E.NAME
;
