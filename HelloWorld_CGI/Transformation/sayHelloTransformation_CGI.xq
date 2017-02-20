(:: pragma bea:global-element-parameter parameter="$inputData1" element="ns0:InputData" location="../Schemas/Input_CGI.xsd" ::)
(:: pragma bea:global-element-return element="ns1:Output" location="../Schemas/Output_CGI.xsd" ::)

declare namespace ns0 = "http://www.example.org/Input";
declare namespace ns1 = "http://www.example.org/Output";
declare namespace xf = "http://tempuri.org/HelloWorld/Transformation/sayHelloTransformation/";

declare function xf:sayHelloTransformation($inputData1 as element(ns0:InputData))
    as element(ns1:Output) {
        <ns1:Output>
            <ns1:Message>{ fn:concat("Hi ",$inputData1/ns0:FirstName," ",$inputData1/ns0:LastName, "From CGI") }</ns1:Message>
        </ns1:Output>
};

declare variable $inputData1 as element(ns0:InputData) external;

xf:sayHelloTransformation($inputData1)