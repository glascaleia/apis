CREATE TABLE accesstoken (id BIGINT NOT NULL, creationDate TIMESTAMP, modificationDate TIMESTAMP, encodedPrincipal TEXT, expires BIGINT, refreshToken VARCHAR(255), resourceOwnerId VARCHAR(255), token VARCHAR(255), client_id BIGINT NOT NULL, PRIMARY KEY (id), CONSTRAINT U_CCSSTKN_REFRESHTOKEN UNIQUE (refreshToken), CONSTRAINT U_CCSSTKN_TOKEN UNIQUE (token));
CREATE TABLE AccessToken_scopes (ACCESSTOKEN_ID BIGINT, element VARCHAR(255));
CREATE TABLE authorizationrequest (id BIGINT NOT NULL, creationDate TIMESTAMP, modificationDate TIMESTAMP, authState VARCHAR(255), authorizationCode VARCHAR(255), encodedPrincipal TEXT, redirectUri VARCHAR(255), responseType VARCHAR(255), state VARCHAR(255), client_id BIGINT NOT NULL, PRIMARY KEY (id));
CREATE TABLE AuthorizationRequest_grantedScopes (AUTHORIZATIONREQUEST_ID BIGINT, element VARCHAR(255));
CREATE TABLE AuthorizationRequest_requestedScopes (AUTHORIZATIONREQUEST_ID BIGINT, element VARCHAR(255));
CREATE TABLE client (id BIGINT NOT NULL, creationDate TIMESTAMP, modificationDate TIMESTAMP, allowedClientCredentials BOOL, allowedImplicitGrant BOOL, clientId VARCHAR(255), contactEmail VARCHAR(255), contactName VARCHAR(255), description VARCHAR(255), expireDuration BIGINT, includePrincipal BOOL, clientName VARCHAR(255), secret VARCHAR(255), skipConsent BOOL, thumbNailUrl VARCHAR(255), useRefreshTokens BOOL, resourceserver_id BIGINT NOT NULL, PRIMARY KEY (id), CONSTRAINT U_CLIENT_CLIENTID UNIQUE (clientId));
CREATE TABLE client_attributes (client_id BIGINT, attribute_name VARCHAR(255) NOT NULL, attribute_value VARCHAR(255));
CREATE TABLE Client_redirectUris (CLIENT_ID BIGINT, element VARCHAR(255));
CREATE TABLE Client_scopes (CLIENT_ID BIGINT, element VARCHAR(255));
CREATE TABLE OPENJPA_SEQUENCE_TABLE (ID SMALLINT NOT NULL, SEQUENCE_VALUE BIGINT, PRIMARY KEY (ID));
CREATE TABLE resourceserver (id BIGINT NOT NULL, creationDate TIMESTAMP, modificationDate TIMESTAMP, contactEmail VARCHAR(255), contactName VARCHAR(255) NOT NULL, description VARCHAR(255), resourceServerKey VARCHAR(255), resourceServerName VARCHAR(255), owner VARCHAR(255), secret VARCHAR(255), thumbNailUrl VARCHAR(255), PRIMARY KEY (id), CONSTRAINT U_RSRCRVR_RESOURCESERVERKEY UNIQUE (resourceServerKey), CONSTRAINT U_RSRCRVR_OWNER UNIQUE (owner, resourceServerName));
CREATE TABLE ResourceServer_scopes (RESOURCESERVER_ID BIGINT, element VARCHAR(255));
CREATE INDEX I_CCSSTKN_CLIENT ON accesstoken (client_id);
CREATE INDEX I_CCSSCPS_ACCESSTOKEN_ID ON AccessToken_scopes (ACCESSTOKEN_ID);
CREATE INDEX I_THRZQST_CLIENT ON authorizationrequest (client_id);
CREATE INDEX I_THRZCPS_AUTHORIZATIONREQUEST_ID ON AuthorizationRequest_grantedScopes (AUTHORIZATIONREQUEST_ID);
CREATE INDEX I_THRZCPS_AUTHORIZATIONREQUEST_ID1 ON AuthorizationRequest_requestedScopes (AUTHORIZATIONREQUEST_ID);
CREATE INDEX I_CLIENT_RESOURCESERVER ON client (resourceserver_id);
CREATE INDEX I_CLNTBTS_CLIENT_ID ON client_attributes (client_id);
CREATE INDEX I_CLNTTRS_CLIENT_ID ON Client_redirectUris (CLIENT_ID);
CREATE INDEX I_CLNTCPS_CLIENT_ID ON Client_scopes (CLIENT_ID);
CREATE INDEX I_RSRCCPS_RESOURCESERVER_ID ON ResourceServer_scopes (RESOURCESERVER_ID);
