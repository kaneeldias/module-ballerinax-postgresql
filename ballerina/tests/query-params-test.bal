// Copyright (c) 2021 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/sql;
import ballerina/test;
import ballerina/time;

@test:Config {
    groups: ["query","query-simple-params"]
}
function querySmallIntParam() returns error? {
    int rowId = 1;
    int smalIntValue1 = 1;
    sql:SmallIntValue smalIntValue2 = new (1);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE smallint_type = ${smalIntValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE smallint_type = ${smalIntValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from NumericTypes WHERE smallint_type = ${smalIntValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from NumericTypes WHERE smallint_type = ${smalIntValue2} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [querySmallIntParam]
}
function queryIntParam() returns error? {
    int rowId = 1;
    int intValue1 = 123;
    sql:IntegerValue intValue2 = new (123);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE int_type = ${intValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE int_type = ${intValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from NumericTypes WHERE int_type = ${intValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from NumericTypes WHERE int_type = ${intValue2} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryIntParam]
}
function queryBigIntParam() returns error? {
    int rowId = 1;
    int bigIntValue1 = 123456;
    sql:BigIntValue bigIntValue2 = new (123456);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE bigint_type = ${bigIntValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE bigint_type = ${bigIntValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from NumericTypes WHERE bigint_type = ${bigIntValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from NumericTypes WHERE bigint_type = ${bigIntValue2} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryBigIntParam]
}
function queryDecimalParam() returns error? {
    int rowId = 1;
    decimal decimalValue1 = 123.456;
    sql:DecimalValue decimalValue2 = new (123.456);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE decimal_type = ${decimalValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE decimal_type = ${decimalValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from NumericTypes WHERE decimal_type = ${decimalValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from NumericTypes WHERE decimal_type = ${decimalValue2} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryDecimalParam]
}
function queryNumericParam() returns error? {
    int rowId = 1;
    decimal numericValue1 = 123.456;
    sql:NumericValue numericValue2 = new (123.456);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE numeric_type = ${numericValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE numeric_type = ${numericValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from NumericTypes WHERE numeric_type = ${numericValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from NumericTypes WHERE numeric_type = ${numericValue2} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryDecimalParam]
}
function queryDoubleParam() returns error? {
    int rowId = 1;
    float doubleValue1 = 234.567;
    sql:DoubleValue doubleValue2 = new (234.567);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE double_type = ${doubleValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE double_type = ${doubleValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from NumericTypes WHERE double_type = ${doubleValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from NumericTypes WHERE double_type = ${doubleValue2} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryDoubleParam]
}
function querySmallSerialParam() returns error? {
    int rowId = 1;
    int smallSerialValue1 = 1;
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE smallserial_type = ${smallSerialValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE smallserial_type = ${smallSerialValue1} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [querySmallIntParam]
}
function querySerialParam() returns error? {
    int rowId = 1;
    int serialValue1 = 123;
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE serial_type = ${serialValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE serial_type = ${serialValue1} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [querySerialParam]
}
function queryBigSerialParam() returns error? {
    int rowId = 1;
    int bigSerialValue1 = 123456;
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NumericTypes WHERE bigserial_type = ${bigSerialValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NumericTypes WHERE bigserial_type = ${bigSerialValue1} and row_id = ${rowId}`;

    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNumericTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryBigSerialParam]
}
function queryCharParam() returns error? {
    int rowId = 1;
    string charValue1 = "This is a char1";
    sql:CharValue charValue2 = new ("This is a char1");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from CharacterTypes WHERE char_type = ${charValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from CharacterTypes WHERE char_type = ${charValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from CharacterTypes WHERE char_type = ${charValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from CharacterTypes WHERE char_type = ${charValue2} and row_id = ${rowId}`;

    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryCharParam]
}
function queryVarcharParam() returns error? {
    int rowId = 1;
    string varcharValue1 = "This is a varchar1";
    sql:VarcharValue varcharValue2 = new ("This is a varchar1");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from CharacterTypes WHERE varchar_type = ${varcharValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from CharacterTypes WHERE varchar_type = ${varcharValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from CharacterTypes WHERE varchar_type = ${varcharValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from CharacterTypes WHERE varchar_type = ${varcharValue2} and row_id = ${rowId}`;

    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryVarcharParam]
}
function queryTextParam() returns error? {
    int rowId = 1;
    string textValue1 = "This is a text1";
    sql:TextValue textValue2 = new ("This is a text1");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from CharacterTypes WHERE text_type = ${textValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from CharacterTypes WHERE text_type = ${textValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from CharacterTypes WHERE text_type = ${textValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from CharacterTypes WHERE text_type = ${textValue2} and row_id = ${rowId}`;

    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTextParam]
}
function queryNameParam() returns error? {
    int rowId = 1;
    string nameValue1 = "This is a name1";
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from CharacterTypes WHERE name_type = ${nameValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from CharacterTypes WHERE name_type = ${nameValue1} and row_id = ${rowId}`;

    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateCharacterTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryNameParam]
}
function queryBooleanParam() returns error? {
    int rowId = 1;
    boolean booleanValue1 = true;
    sql:BooleanValue booleanValue2 = new (true);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from BooleanTypes WHERE boolean_type = ${booleanValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from BooleanTypes WHERE boolean_type = ${booleanValue2}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from BooleanTypes WHERE boolean_type = ${booleanValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from BooleanTypes WHERE boolean_type = ${booleanValue2} and row_id = ${rowId}`;

    validateBooleanTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateBooleanTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateBooleanTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateBooleanTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryBooleanParam]
}
function queryInetParam() returns error? {
    int rowId = 1;
    InetValue inetValue1 = new ("192.168.0.1/24");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NetworkTypes WHERE inet_type = ${inetValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NetworkTypes WHERE inet_type = ${inetValue1} and row_id = ${rowId}`;

    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryInetParam]
}
function queryCidrParam() returns error? {
    int rowId = 1;
    CidrValue cidrValue1 = new ("::ffff:1.2.3.0/120");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NetworkTypes WHERE cidr_type = ${cidrValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NetworkTypes WHERE cidr_type = ${cidrValue1} and row_id = ${rowId}`;

    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryCidrParam]
}
function queryMacaddrParam() returns error? {
    int rowId = 1;
    MacAddrValue macaddrValue1 = new ("08:00:2b:01:02:03");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NetworkTypes WHERE macaddr_type = ${macaddrValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NetworkTypes WHERE macaddr_type = ${macaddrValue1} and row_id = ${rowId}`;

    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryMacaddrParam]
}
function queryMacaddr8Param() returns error? {
    int rowId = 1;
    MacAddr8Value macaddr8Value1 = new ("08:00:2b:01:02:03:04:05");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from NetworkTypes WHERE macaddr8_type = ${macaddr8Value1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from NetworkTypes WHERE macaddr8_type = ${macaddr8Value1} and row_id = ${rowId}`;

    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateNetworkTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryMacaddr8Param]
}
function queryLineParam() returns error? {
    int rowId = 1;
    LineValue lineValue1 = new ("{1,2,3}");
    LineValue lineValue2 = new ({a: 1, b:2, c:3});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from GeometricTypes WHERE line_type = ${lineValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from GeometricTypes WHERE line_type = ${lineValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from GeometricTypes WHERE line_type = ${lineValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from GeometricTypes WHERE line_type = ${lineValue2} and row_id = ${rowId}`;

    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryLineParam]
}
function queryLsegParam() returns error? {
    int rowId = 1;
    LineSegmentValue lsegValue1 = new ("[(1,1),(2,2)]");
    LineSegmentValue lsegValue2 = new ({x1: 1, y1: 1, x2: 2, y2: 2});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from GeometricTypes WHERE lseg_type = ${lsegValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from GeometricTypes WHERE lseg_type = ${lsegValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from GeometricTypes WHERE lseg_type = ${lsegValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from GeometricTypes WHERE lseg_type = ${lsegValue2} and row_id = ${rowId}`;

    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryLsegParam]
}
function queryBoxParam() returns error? {
    int rowId = 1;
    BoxValue boxValue1 = new ("(2,2),(1,1)");
    BoxValue boxValue2 = new ({x1: 1, y1: 1, x2: 2, y2: 2});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from GeometricTypes WHERE box_type = ${boxValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from GeometricTypes WHERE box_type = ${boxValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from GeometricTypes WHERE box_type = ${boxValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from GeometricTypes WHERE box_type = ${boxValue2} and row_id = ${rowId}`;

    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryBoxParam]
}
function queryPathParam() returns error? {
    int rowId = 1;
    PathValue pathValue1 = new ("[(1,1),(2,2)]");
    PathValue pathValue2 = new ({open: true, points: [{x: 1, y: 1}, {x:2, y:2}]});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from GeometricTypes WHERE path_type = ${pathValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from GeometricTypes WHERE path_type = ${pathValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from GeometricTypes WHERE path_type = ${pathValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from GeometricTypes WHERE path_type = ${pathValue2} and row_id = ${rowId}`;

    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryBoxParam]
}
function queryCircleParam() returns error? {
    int rowId = 1;
    CircleValue circleValue1 = new ("<(1,1),1>");
    CircleValue circleValue2 = new ({x: 1, y:1, r:1});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from GeometricTypes WHERE circle_type = ${circleValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from GeometricTypes WHERE circle_type = ${circleValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from GeometricTypes WHERE circle_type = ${circleValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from GeometricTypes WHERE circle_type = ${circleValue2} and row_id = ${rowId}`;

    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateGeometricTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryCircleParam]
}
function queryUuidParam() returns error? {
    int rowId = 1;
    UuidValue uuidValue1 = new ("a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from UuidTypes WHERE uuid_type = ${uuidValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from UuidTypes WHERE uuid_type = ${uuidValue1} and row_id = ${rowId}`;

    validateUuidTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateUuidTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryUuidParam]
}
function queryTsvectorParam() returns error? {
    int rowId = 1;
    TsVectorValue tsvectorValue1 = new ("a fat cat sat on a mat and ate a fat rat");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from TextSearchTypes WHERE tsvector_type = ${tsvectorValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from TextSearchTypes WHERE tsvector_type = ${tsvectorValue1} and row_id = ${rowId}`;

    validateTextSearchTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateTextSearchTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTsvectorParam]
}
function queryTsqueryParam() returns error? {
    int rowId = 1;
    TsQueryValue tsqueryValue1 = new ("fat & rat");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from TextSearchTypes WHERE tsquery_type = ${tsqueryValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from TextSearchTypes WHERE tsquery_type = ${tsqueryValue1} and row_id = ${rowId}`;

    validateTextSearchTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateTextSearchTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}


@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTsqueryParam]
}
function queryJsonbParam() returns error? {
    int rowId = 1;
    json jsonbValue = {"key1": "value", "key2": 2};
    JsonBinaryValue jsonbValue1 = new ("{\"key1\": \"value\", \"key2\": 2}");
    JsonBinaryValue jsonbValue2 = new (jsonbValue);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from JsonTypes WHERE jsonb_type = ${jsonbValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from JsonTypes WHERE jsonb_type = ${jsonbValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from JsonTypes WHERE jsonb_type = ${jsonbValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from JsonTypes WHERE jsonb_type = ${jsonbValue2} and row_id = ${rowId}`;

    validateJsonTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateJsonTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateJsonTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateJsonTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));

}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryJsonbParam]
}
function queryDateValueParam() returns error? {
    int rowId = 1;
    time:Date dateValue = {year: 1999, month: 1, day: 8};
    sql:DateValue dateValue1 = new (dateValue);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from DatetimeTypes WHERE date_type = ${dateValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from DatetimeTypes WHERE date_type = ${dateValue1} and row_id = ${rowId}`;

    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryDateValueParam]
}
function queryTimeValueParam() returns error? {
    int rowId = 1;
    time:TimeOfDay time = {hour: 4, minute: 5, second: 6};
    sql:TimeValue timeValue1 = new (time);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from DatetimeTypes WHERE time_type = ${timeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from DatetimeTypes WHERE time_type = ${timeValue1} and row_id = ${rowId}`;

    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
 }

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTimeValueParam]
}
function queryTimestampValueParam() returns error? {
    int rowId = 1;
    time:Utc timestampValue = check time:utcFromString("1999-01-08T04:05:06.000+00:00");
    sql:TimestampValue timestampValue1 = new (timestampValue);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from DatetimeTypes WHERE timestamp_type = ${timestampValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from DatetimeTypes WHERE timestamp_type = ${timestampValue1} and row_id = ${rowId}`;

    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTimestampValueParam]
}
function queryTimestamptzValueParam() returns error? {
    int rowId = 1;
    time:Utc timestamptz = check time:utcFromString("2004-10-19T08:23:54.000+00:00");
    sql:TimestampValue timestamptzValue = new (timestamptz);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from DatetimeTypes WHERE timestamptz_type = ${timestamptzValue}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from DatetimeTypes WHERE timestamptz_type = ${timestamptzValue} and row_id = ${rowId}`;

    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateDatetimeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTimestamptzValueParam]
}
function queryInt4rangeParam() returns error? {
    int rowId = 1;
    IntegerRangeValue int4rangeValue1 = new ("[3,50)");
    IntegerRangeValue int4rangeValue2 = new ({upper: 50, lower :3, lowerboundInclusive: true, upperboundInclusive: false});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from RangeTypes WHERE int4range_type = ${int4rangeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from RangeTypes WHERE int4range_type = ${int4rangeValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from RangeTypes WHERE int4range_type = ${int4rangeValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from RangeTypes WHERE int4range_type = ${int4rangeValue2} and row_id = ${rowId}`;

    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryInt4rangeParam]
}
function queryInt8rangeParam() returns error? {
    int rowId = 1;
    LongRangeValue int8rangeValue1 = new ("[11,100)");
    LongRangeValue int8rangeValue2 = new ({upper: 100, lower : 11, lowerboundInclusive: true, upperboundInclusive: false});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from RangeTypes WHERE int8range_type = ${int8rangeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from RangeTypes WHERE int8range_type = ${int8rangeValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from RangeTypes WHERE int8range_type = ${int8rangeValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from RangeTypes WHERE int8range_type = ${int8rangeValue2} and row_id = ${rowId}`;

    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryInt8rangeParam]
}
function queryNumrangeParam() returns error? {
    int rowId = 1;
    NumericRangeValue numrangeValue1 = new ("(0,24)");
    NumericRangeValue numrangeValue2 = new ({upper: 24, lower : 0, lowerboundInclusive: false, upperboundInclusive: false});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from RangeTypes WHERE numrange_type = ${numrangeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from RangeTypes WHERE numrange_type = ${numrangeValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from RangeTypes WHERE numrange_type = ${numrangeValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from RangeTypes WHERE numrange_type = ${numrangeValue2} and row_id = ${rowId}`;

    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryNumrangeParam]
}
function queryTsrangeParam() returns error? {
    int rowId = 1;
    TsRangeValue tsrangeValue1 = new ("(2010-01-01 14:30, 2010-01-01 15:30)");
    TsRangeValue tsrangeValue2 = new ({lower: "2010-01-01 14:30", upper: "2010-01-01 15:30"});
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from RangeTypes WHERE tsrange_type = ${tsrangeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from RangeTypes WHERE tsrange_type = ${tsrangeValue1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from RangeTypes WHERE tsrange_type = ${tsrangeValue2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from RangeTypes WHERE tsrange_type = ${tsrangeValue2} and row_id = ${rowId}`;

    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryTsrangeParam]
}
function queryDaterangeParam() returns error? {
    int rowId = 1;
    DateRangeValue daterangeValue1 = new ("(2010-01-01 14:30, 2010-01-03 )");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from RangeTypes WHERE daterange_type = ${daterangeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from RangeTypes WHERE daterange_type = ${daterangeValue1} and row_id = ${rowId}`;

    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateRangeTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryDaterangeParam]
}
function queryVarbitParam() returns error? {
    int rowId = 1;
    VarBitStringValue varbitstringValue1 = new ("1101");
    sql:ParameterizedQuery sqlQuery1 = `SELECT row_id, varbitstring_type, bit_type from BitTypes WHERE varbitstring_type = ${varbitstringValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT row_id, varbitstring_type, bit_type from BitTypes WHERE varbitstring_type = ${varbitstringValue1} and row_id = ${rowId}`;

    validateBitTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateBitTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryVarbitParam]
}
function queryBitValueParam() returns error? {
    int rowId = 1;
    PGBitValue bitValue1 = new ("1");
    sql:ParameterizedQuery sqlQuery1 = `SELECT row_id, varbitstring_type, bit_type from BitTypes WHERE bit_type = ${bitValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT row_id, varbitstring_type, bit_type from BitTypes WHERE bit_type = ${bitValue1} and row_id = ${rowId}`;

    validateBitTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateBitTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}


@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryBitValueParam]
}
function queryOidValueParam() returns error? {
    int rowId = 1;
    int oidValue1 = 12;
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE oid_type = ${oidValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE oid_type = ${oidValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryOidValueParam]
}
function queryRegclassValueParam() returns error? {
    int rowId = 1;
    RegClassValue regclassValue1 = new ("pg_type");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regclass_type = ${regclassValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regclass_type = ${regclassValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegclassValueParam]
}
function queryRegconfigValueParam() returns error? {
    int rowId = 1;
    RegConfigValue regconfigValue1 = new ("english");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regconfig_type = ${regconfigValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regconfig_type = ${regconfigValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegconfigValueParam]
}
function queryRegdictionaryValueParam() returns error? {
    int rowId = 1;
    RegDictionaryValue regdictionaryValue1 = new ("simple");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regdictionary_type = ${regdictionaryValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regdictionary_type = ${regdictionaryValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegdictionaryValueParam]
}
function queryRegnamespaceValueParam() returns error? {
    int rowId = 1;
    RegNamespaceValue regnamespaceValue1 = new ("pg_catalog");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regnamespace_type = ${regnamespaceValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regnamespace_type = ${regnamespaceValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegnamespaceValueParam]
}
function queryRegoperValueParam() returns error? {
    int rowId = 1;
    RegOperValue regoperValue1 = new ("||/");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regoper_type = ${regoperValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regoper_type = ${regoperValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegoperValueParam]
}
function queryRegoperatorValueParam() returns error? {
    int rowId = 1;
    RegOperatorValue regoperatorValue1 = new ("*(integer,integer)");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regoperator_type = ${regoperatorValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regoperator_type = ${regoperatorValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegoperatorValueParam]
}
function queryRegprocValueParam() returns error? {
    int rowId = 1;
    RegProcValue regprocValue1 = new ("now");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regproc_type = ${regprocValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regproc_type = ${regprocValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegprocValueParam]
}
function queryRegprocedureValueParam() returns error? {
    int rowId = 1;
    RegProcedureValue regprocedureValue1 = new ("sum(integer)");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regprocedure_type = ${regprocedureValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regprocedure_type = ${regprocedureValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegprocedureValueParam]
}
function queryRegroleValueParam() returns error? {
    int rowId = 1;
    RegRoleValue regroleValue1 = new ("postgres");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regrole_type = ${regroleValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regrole_type = ${regroleValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryRegroleValueParam]
}
function queryRegtypeValueParam() returns error? {
    int rowId = 1;
    RegTypeValue regtypeValue1 = new ("integer");
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from Objectidentifiertypes WHERE regtype_type = ${regtypeValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from Objectidentifiertypes WHERE regtype_type = ${regtypeValue1} and row_id = ${rowId}`;

    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateObjectidentifierTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryUuidParam]
}
function queryByteaParam() returns error? {
    int rowId = 1;
    byte[] byteArray = [222,173,190,239];
    sql:BinaryValue byteaValue1 = new (byteArray);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from BinaryTypes WHERE bytea_type = ${byteaValue1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from BinaryTypes WHERE bytea_type = ${byteaValue1} and row_id = ${rowId}`;

    validateBinaryTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateBinaryTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryByteaParam]
}
function queryMoneyParam() returns error? {
    int rowId = 1;
    string moneyValue1 = "$124.56";
    decimal moneyValue2 = 124.56;
    MoneyValue moneyType1 = new (moneyValue1);
    MoneyValue moneyType2 = new (moneyValue2);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from MoneyTypes WHERE money_type = ${moneyType1}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from MoneyTypes WHERE money_type = ${moneyType1} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from MoneyTypes WHERE money_type = ${moneyType2}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from MoneyTypes WHERE money_type = ${moneyType2} and row_id = ${rowId}`;

    validateMoneyTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateMoneyTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateMoneyTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateMoneyTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryMoneyParam]
}
function queryArrayParam() returns error? {
    int rowId = 1;
    sql:BigIntArrayValue bigIntArray = new([10000,20000,30000]);
    decimal[] decimalArray =  [1.1,2.2,3.3,4.4];
    decimal[] numericArray =  [1.1,2.2,3.3,4.4];
    string[] varcharArray = ["This is a VarChar1","This is a VarChar2"];
    boolean[] booleanArray = [true, false, true];

    sql:ParameterizedQuery sqlQuery1 = `SELECT * from ArrayTypes WHERE bigintarray_type = ${bigIntArray}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from ArrayTypes WHERE bigintarray_type = ${bigIntArray} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from ArrayTypes WHERE decimalarray_type = ${decimalArray}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from ArrayTypes WHERE decimalarray_type = ${decimalArray} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery5 = `SELECT * from ArrayTypes WHERE numericarray_type = ${numericArray}`;
    sql:ParameterizedQuery sqlQuery6 = `SELECT * from ArrayTypes WHERE numericarray_type = ${numericArray} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery7 = `SELECT * from ArrayTypes WHERE varchararray_type = ${varcharArray}`;
    sql:ParameterizedQuery sqlQuery8 = `SELECT * from ArrayTypes WHERE varchararray_type = ${varcharArray} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery9 = `SELECT * from ArrayTypes WHERE booleanarray_type = ${booleanArray}`;
    sql:ParameterizedQuery sqlQuery10 = `SELECT * from ArrayTypes WHERE booleanarray_type = ${booleanArray} and row_id = ${rowId}`;

    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery3, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery4, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery5, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery6, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery7, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery8, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery9, database = simpleParamsDb));
    validateArrayTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery10, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryArrayParam]
}
function queryArrayParam2() returns error? {
    int rowId = 1;
    float float1 = 1;
    float float2 = 1;
    sql:SmallIntArrayValue smallintArrayValue = new([12, 232]);
    sql:IntegerArrayValue intArrayValue = new([1, 2, 3]);
    sql:BigIntArrayValue bigintArrayValue = new([100000000, 200000000, 300000000]);
    sql:VarcharArrayValue varcharArrayValue = new(["Hello", "Ballerina"]);
    sql:BooleanArrayValue booleanArrayValue = new([true, false, true]);
    time:Date date = {year: 2017, month: 2, day: 3};
    sql:DateArrayValue dateArrayValue = new([date, date]);
    time:TimeOfDay timeVal1 = {hour: 11, minute: 53, second: 0};
    time:TimeOfDay timeVal2 = {hour: 11, minute: 53, second: 2};
    sql:TimeArrayValue timeArrayValue = new([timeVal1, timeVal2]);
    time:Civil datetimeVal1 = {year: 2017, month: 2, day: 3, hour: 11, minute: 53, second: 0};
    time:Civil datetimeVal2 = {year: 2019, month: 4, day: 5, hour: 12, minute: 33, second: 10};
    sql:DateTimeArrayValue timestampArrayValue = new([datetimeVal1, datetimeVal2]);

    sql:ParameterizedQuery sqlQuery1 = `SELECT * from ArrayTypes2 WHERE smallint_array = ${smallintArrayValue}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from ArrayTypes2 WHERE smallint_array = ${smallintArrayValue} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery3 = `SELECT * from ArrayTypes2 WHERE int_array = ${intArrayValue}`;
    sql:ParameterizedQuery sqlQuery4 = `SELECT * from ArrayTypes2 WHERE int_array = ${intArrayValue} and row_id = ${rowId}`;
    sql:ParameterizedQuery sqlQuery5 = `SELECT * from ArrayTypes2 WHERE bigint_array = ${bigintArrayValue}`;
    sql:ParameterizedQuery sqlQuery6 = `SELECT * from ArrayTypes2 WHERE bigint_array = ${bigintArrayValue} and row_id = ${rowId}`;
    validateArrayTableQueryResult2(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateArrayTableQueryResult2(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"],
    dependsOn: [queryMoneyParam]
}
function queryEnumParam() returns error? {
    int rowId = 1;
    Enum enumRecord = {value: "value1"};
    EnumValue enumValue = new (sqlTypeName = "value", value = enumRecord);
    sql:ParameterizedQuery sqlQuery1 = `SELECT * from EnumTypes WHERE value_type = ${enumValue}`;
    sql:ParameterizedQuery sqlQuery2 = `SELECT * from EnumTypes WHERE value_type = ${enumValue} and row_id = ${rowId}`;

    validateEnumTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery1, database = simpleParamsDb));
    validateEnumTableQueryResult(check simpleQueryPostgresqlClient(sqlQuery2, database = simpleParamsDb));
}

@test:Config {
    groups: ["query","query-simple-params"]
}
function queryRecord() returns sql:Error? {
    int rowId = 1;
    sql:ParameterizedQuery sqlQuery = `SELECT * from NumericTypes WHERE row_id = ${rowId}`;
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    record {} queryResult = check dbClient->queryRow(sqlQuery);
    check dbClient.close();
    validateNumericTableQueryResult(queryResult);
}

@test:Config {
    groups: ["query","query-simple-params"]
}
function queryRecordNegative() returns sql:Error? {
    int rowId = 999;
    sql:ParameterizedQuery sqlQuery = `SELECT * from NumericTypes WHERE row_id = ${rowId}`;
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    record {}|sql:Error queryResult = dbClient->queryRow(sqlQuery);
    check dbClient.close();
    if queryResult is sql:Error {
        test:assertTrue(queryResult is sql:NoRowsError);
        test:assertTrue(queryResult.message().endsWith("Query did not retrieve any rows."), "Incorrect error message");
   } else {
       test:assertFail("Expected no rows error with empty query result.");
   }
}

@test:Config {
    groups: ["query", "query-simple-params"]
}
function queryRecordNegative2() returns error? {
    int rowId = 1;
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    sql:ParameterizedQuery sqlQuery = `SELECT * from validateNumericTableQueryResult WHERE row_id = ${rowId}`;
    record{}|int|error queryResult = dbClient->queryRow(sqlQuery);
    check dbClient.close();
    if queryResult is error {
        test:assertEquals(queryResult.message(), "Return type cannot be a union of multiple types.");
    } else {
        test:assertFail("Expected error when querying with union return type.");
    }
}

@test:Config {
    groups: ["query", "query-simple-params"]
}
function queryRecordNegative3() returns error? {
    int rowId = 1;
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    sql:ParameterizedQuery sqlQuery = `SELECT row_id, invalid_column_name from NumericTypes WHERE row_id = ${rowId}`;
    record{}|error queryResult = dbClient->queryRow(sqlQuery);
    check dbClient.close();
    if queryResult is error {
        test:assertTrue(queryResult.message().endsWith("ERROR: column \"invalid_column_name\" does not exist\n  Position: 16."),
                        "Incorrect error message");
    } else {
        test:assertFail("Expected error when querying with invalid column name.");
    }
}

@test:Config {
    groups: ["query", "query-simple-params"]
}
function queryValue() returns error? {
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    int count = check dbClient->queryRow(`SELECT COUNT(*) FROM NumericTypes`);
    check dbClient.close();
    test:assertEquals(count, 7);
}

@test:Config {
    groups: ["query", "query-simple-params"]
}
function queryValueNegative1() returns error? {
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    int rowId = 1;
    sql:ParameterizedQuery sqlQuery = `SELECT * from NumericTypes WHERE row_id = ${rowId}`;
    int|error queryResult = dbClient->queryRow(sqlQuery);
    check dbClient.close();
    if queryResult is error {
        test:assertTrue(queryResult is sql:TypeMismatchError, "Incorrect error type");
        test:assertEquals(queryResult.message(), "Expected type to be 'int' but found 'record{}'.");
    } else {
        test:assertFail("Expected error when query result contains multiple columns.");
    }
}

@test:Config {
    groups: ["query", "query-simple-params"]
}
function queryValueNegative2() returns error? {
    Client dbClient = check new (host, user, password, simpleParamsDb, port);
    int rowId = 1;
    sql:ParameterizedQuery sqlQuery = `SELECT varchar_type from CharacterTypes WHERE row_id = ${rowId}`;
    int|error queryResult = dbClient->queryRow(sqlQuery);
    check dbClient.close();
    if queryResult is error {
        test:assertEquals(queryResult.message(),
                          "SQL Type 'Retrieved SQL type' cannot be converted to ballerina type 'int'.",
                          "Incorrect error message");
    } else {
        test:assertFail("Expected error when query returns unexpected result type.");
    }
}

isolated function validateNumericTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        decimal decimalVal = 123.456;
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["smallint_type"], 1);
        test:assertEquals(returnData["int_type"], 123);
        test:assertEquals(returnData["bigint_type"], 123456);
        test:assertEquals(returnData["decimal_type"], decimalVal);
        test:assertEquals(returnData["numeric_type"], decimalVal);
        test:assertTrue(returnData["real_type"] is float);
        test:assertTrue(returnData["double_type"] is float);
        test:assertEquals(returnData["smallserial_type"], 1);
        test:assertEquals(returnData["serial_type"], 123);
        test:assertEquals(returnData["bigserial_type"], 123456);
    }
}

isolated function validateCharacterTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["char_type"], "This is a char1");
        test:assertEquals(returnData["varchar_type"], "This is a varchar1");
        test:assertEquals(returnData["text_type"], "This is a text1");
        test:assertEquals(returnData["name_type"], "This is a name1");
    }
}

isolated function validateBooleanTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["boolean_type"], true);
    }
}

isolated function validateNetworkTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["inet_type"], "192.168.0.1/24");
        test:assertEquals(returnData["cidr_type"], "::ffff:1.2.3.0/120");
        test:assertEquals(returnData["macaddr_type"], "08:00:2b:01:02:03");
        test:assertEquals(returnData["macaddr8_type"], "08:00:2b:01:02:03:04:05");
    }
}

isolated function validateGeometricTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["point_type"], "(1,2)");
        test:assertEquals(returnData["line_type"], "{1,2,3}");
        test:assertEquals(returnData["lseg_type"], "[(1,1),(2,2)]");
        test:assertEquals(returnData["box_type"], "(2,2),(1,1)");
        test:assertEquals(returnData["path_type"], "[(1,1),(2,2)]");
        test:assertEquals(returnData["polygon_type"], "((1,1),(2,2))");
        test:assertEquals(returnData["circle_type"], "<(1,1),1>");
    }
}

isolated function validateUuidTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["uuid_type"], "a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11");
    }
}

isolated function validateTextSearchTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["tsvector_type"], "'a' 'and' 'ate' 'cat' 'fat' 'mat' 'on' 'rat' 'sat'");
        test:assertEquals(returnData["tsquery_type"], "'fat' & 'rat'");
    }
}

isolated function validateJsonTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["json_type"], "{\"key1\": \"value\", \"key2\": 2}");
        test:assertEquals(returnData["jsonb_type"], "{\"key1\": \"value\", \"key2\": 2}");
        test:assertEquals(returnData["jsonpath_type"], "$.\"floor\"[*].\"apt\"[*]?(@.\"area\" > 40 && @.\"area\" < 90)?(@.\"rooms\" > 1)");
    }
}

isolated function validateDatetimeTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["time_type"], "04:05:06");
        test:assertEquals(returnData["timestamp_type"], "1999-01-08 04:05:06.0");
        test:assertEquals(returnData["date_type"], "1999-01-08");
        test:assertEquals(returnData["interval_type"], "1 year 2 mons 3 days 04:05:06");
    }
}

isolated function validateRangeTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["int4range_type"], "[3,50)");
        test:assertEquals(returnData["int8range_type"], "[11,100)");
        test:assertEquals(returnData["numrange_type"], "(0,24)");
        test:assertEquals(returnData["tsrange_type"], "(\"2010-01-01 14:30:00\",\"2010-01-01 15:30:00\")");
        test:assertEquals(returnData["daterange_type"], "[2010-01-02,2010-01-03)");
    }
}

isolated function validatePglsnTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["pglsn_type"], "16/B374D848");
    }
}

isolated function validateBitTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["varbitstring_type"], "1101");
        test:assertEquals(returnData["bit_type"], true);
    }
}

isolated function validateObjectidentifierTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["oid_type"], 12);
        test:assertEquals(returnData["regclass_type"], "pg_type");
        test:assertEquals(returnData["regconfig_type"], "english");
        test:assertEquals(returnData["regdictionary_type"], "simple");
        test:assertEquals(returnData["regnamespace_type"], "pg_catalog");
        test:assertEquals(returnData["regoper_type"], "||/");
        test:assertEquals(returnData["regoperator_type"], "*(integer,integer)");
        test:assertEquals(returnData["regproc_type"], "now");
        test:assertEquals(returnData["regprocedure_type"], "sum(integer)");
        test:assertEquals(returnData["regrole_type"], "postgres");
        test:assertEquals(returnData["regtype_type"], "integer");
    }
}

isolated function validateBinaryTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["bytea_type"], [222,173,190,239]);
    }
}

isolated function validateXmlTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["xml_type"], xml `<foo><tag>bar</tag><tag>tag</tag></foo>`);
    }
}

isolated function validateMoneyTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["money_type"], 124.56);
    }
}

isolated function validateEnumTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["value_type"], "value1");
    }
}

isolated function validateArrayTableQueryResult(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        decimal[] decimalArray = [1.1,2.2,3.3,4.4];
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["bigintarray_type"], [10000,20000,30000]);
        test:assertEquals(returnData["decimalarray_type"], decimalArray);
        test:assertEquals(returnData["numericarray_type"], decimalArray);
        test:assertTrue(returnData["realarray_type"] is float[]);
        test:assertTrue(returnData["doublearray_type"] is float[]);
        test:assertEquals(returnData["chararray_type"], ["This is a Char1","This is a Char2"]);
        test:assertEquals(returnData["varchararray_type"], ["This is a VarChar1","This is a VarChar2"]);
        test:assertEquals(returnData["textarray_type"], ["This is a Text1","This is a Text2"]);
        test:assertEquals(returnData["booleanarray_type"], [true,false,true]);
    }
}

isolated function validateArrayTableQueryResult2(record{}? returnData) {
    if (returnData is ()) {
        test:assertFail("Empty row returned.");
    } else {
        test:assertEquals(returnData["row_id"], 1);
        test:assertEquals(returnData["smallint_array"], [12, 232]);
        test:assertEquals(returnData["int_array"], [1, 2, 3]);
        test:assertEquals(returnData["bigint_array"], [100000000, 200000000, 300000000]);
        test:assertEquals(returnData["decimal_array"], <decimal[]>[245.12, 5559.12, 8796.12]);
        test:assertEquals(returnData["numeric_array"], <decimal[]>[12.323, 232.21]);
        test:assertTrue(returnData["real_array"] is float[]);
        test:assertTrue(returnData["double_array"] is float[]);
        test:assertEquals(returnData["varchar_array"], ["Hello", "Ballerina"]);
        test:assertEquals(returnData["string_array"], ["Hello", "Ballerina"]);
        test:assertEquals(returnData["char_array"], ["Hello          ", "Ballerina      "]);
        test:assertEquals(returnData["boolean_array"], [true, false, true]);
        test:assertTrue(returnData["bytea_array"] is byte[][]);
    }
}

function simpleQueryPostgresqlClient(sql:ParameterizedQuery sqlQuery,
                                     string database = simpleParamsDb) returns record {}? | error {
    Client dbClient = check new (host, user, password, database, port);
    stream<record {}, error?> streamData = dbClient->query(sqlQuery);
    record {|record {} value;|}? data = check streamData.next();
    check streamData.close();
    record {}? value = data?.value;
    check dbClient.close();
    return value;
}
