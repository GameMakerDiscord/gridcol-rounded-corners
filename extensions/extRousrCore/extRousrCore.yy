{
    "id": "41aa7af4-8ff0-4c74-b128-a0ebf7e056c1",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "extRousrCore",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": false,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 194,
    "date": "2017-33-29 08:12:44",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "32df1491-b20f-4ad6-8ac8-a825b3536e2d",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 194,
            "filename": "extRousrCore.gml",
            "final": "",
            "functions": [
                {
                    "id": "ad1249aa-06d5-4220-85d6-2c668e56752b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_singleton",
                    "help": "called `with` object to be singleton - ensure the name passed is a singleton, will call instance destroy on a different id (_singleton_name)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_singleton",
                    "returnType": 2
                },
                {
                    "id": "1abe46e4-6a35-4246-9853-a139ff877f5c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_font",
                    "help": "cache the current font (font)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_font",
                    "returnType": 2
                },
                {
                    "id": "c7db3fae-0ec7-4377-82b1-39ccef6a0a14",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_ensure_color",
                    "help": "cache the current color (_color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_ensure_color",
                    "returnType": 2
                },
                {
                    "id": "5cf6553e-7c8a-44ad-a60c-fe6f69eabe52",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_color_hex",
                    "help": "[Convert the RGB to BGR][https:\/\/forum.yoyogames.com\/index.php?threads\/why-are-hex-colours-bbggrr-instead-of-rrggbb.16325\/#post-105309] (color)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_color_hex",
                    "returnType": 2
                },
                {
                    "id": "6f1d09ed-0687-41c8-95c1-4e8d634766fc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_color_glsl",
                    "help": "convert a color to an array float values [0.0 - 1.0] (_color, [_out_array])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_color_glsl",
                    "returnType": 2
                },
                {
                    "id": "ba847a78-67e0-4ea2-b4cd-6c44c1e95577",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_next_pot",
                    "help": "return the nearest power of 2 for a given number [integer] (_va)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_next_pot",
                    "returnType": 2
                },
                {
                    "id": "e4b2d69c-5915-4013-aee6-7d666cc2839f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_shadow_text",
                    "help": "Draw text with a shadow (_x, _y, _text, _fg, _bg, [_xoff=1], [_yoff=1])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_shadow_text",
                    "returnType": 2
                },
                {
                    "id": "925e83e1-5e51-4e78-b898-bf2b0cfb80d6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_outline_text",
                    "help": "draw text with an oultine (_x, _y, _text, _fg, _bg)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_outline_text",
                    "returnType": 2
                },
                {
                    "id": "ce794530-e716-4070-afaf-84e42ff6ee50",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_error",
                    "help": "Error wrapper [eventual logging system] ([_system], _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_error",
                    "returnType": 2
                },
                {
                    "id": "d5c93695-c15c-4aef-b16d-711c37b7a567",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_log",
                    "help": "Log wrapper [eventual logging system] ([_system], _text)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_log",
                    "returnType": 2
                },
                {
                    "id": "da72a933-5275-46bb-a164-0d27b698ee65",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_execute",
                    "help": "(_script_index, _params, [paramCount])",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_execute",
                    "returnType": 2
                },
                {
                    "id": "a3829e38-6efb-429d-89f3-7259fec70647",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "sr_aabb_contains_line",
                    "help": "courtesy of https:\/\/stackoverflow.com\/questions\/1585525\/how-to-find-the-intersection-point-between-a-line-and-a-rectangle (_line_x1, _line_y1, _line_x2, _line_y2, _rect_min_x, _rect_min_y, _rect_max_x, _rect_max_y)",
                    "hidden": false,
                    "kind": 1,
                    "name": "sr_aabb_contains_line",
                    "returnType": 2
                },
                {
                    "id": "1f479d11-91a8-4751-bdb3-fb11697209e5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "__extrousrcore_script_index",
                    "help": "Returns the actual runtime script index because YYG doesn't know how to do that apparently (ext_script_index)",
                    "hidden": false,
                    "kind": 1,
                    "name": "__extrousrcore_script_index",
                    "returnType": 2
                }
            ],
            "init": "",
            "kind": 2,
            "order": [
                "ad1249aa-06d5-4220-85d6-2c668e56752b",
                "1abe46e4-6a35-4246-9853-a139ff877f5c",
                "c7db3fae-0ec7-4377-82b1-39ccef6a0a14",
                "5cf6553e-7c8a-44ad-a60c-fe6f69eabe52",
                "6f1d09ed-0687-41c8-95c1-4e8d634766fc",
                "ba847a78-67e0-4ea2-b4cd-6c44c1e95577",
                "e4b2d69c-5915-4013-aee6-7d666cc2839f",
                "925e83e1-5e51-4e78-b898-bf2b0cfb80d6",
                "ce794530-e716-4070-afaf-84e42ff6ee50",
                "d5c93695-c15c-4aef-b16d-711c37b7a567",
                "da72a933-5275-46bb-a164-0d27b698ee65",
                "a3829e38-6efb-429d-89f3-7259fec70647",
                "1f479d11-91a8-4751-bdb3-fb11697209e5"
            ],
            "origname": "",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": false,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "version": "0.12.0"
}