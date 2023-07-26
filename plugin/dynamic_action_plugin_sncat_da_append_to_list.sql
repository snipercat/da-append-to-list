prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.03.31'
,p_release=>'19.1.0.00.15'
,p_default_workspace_id=>5551613053421489
,p_default_application_id=>105
,p_default_owner=>'SNCAT'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/sncat_da_append_to_list
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(63702359166525197)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'SNCAT.DA.APPEND_TO_LIST'
,p_display_name=>'Append to List'
,p_category=>'COMPONENT'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>'#PLUGIN_FILES#appendToList.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION render(p_dynamic_action IN apex_plugin.t_dynamic_action,',
'                p_plugin         IN apex_plugin.t_plugin)',
'    RETURN apex_plugin.t_dynamic_action_render_result ',
'IS',
'  l_result       apex_plugin.t_dynamic_action_render_result;',
'BEGIN',
'  l_result.attribute_01 := p_dynamic_action.attribute_01; --ReturnItem',
'  l_result.attribute_02 := p_dynamic_action.attribute_02; --Separator',
'  l_result.javascript_function := ''appendToList.execute'';',
'',
'  RETURN l_result;',
'',
'END render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'ITEM:REQUIRED'
,p_substitute_attributes=>false
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This Plugin should be triggered on a ''dialog closed'' event. It will retrieve the return value from the item specified in the plugin attributes and append the value to the affected items. The plugin will check if the value already exists to avoid dupl'
||'icates. You can specify the separator character; its default value is a colon ('':'').',
'</br></br>',
'Furthermore, this item can be used in a query to display or process this data with the help of <i>apex_string.split</i> or <i>apex_string.split_numbers</i>.'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/snipercat/da-append-to-list'
,p_files_version=>7
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(63703796859229232)
,p_plugin_id=>wwv_flow_api.id(63702359166525197)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Return Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'P2_SELECTED'
,p_help_text=>'Select the returning item from the closed dialog'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(63717176138126556)
,p_plugin_id=>wwv_flow_api.id(63702359166525197)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Separator Character'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_common=>false
,p_show_in_wizard=>false
,p_default_value=>':'
,p_max_length=>1
,p_is_translatable=>false
,p_examples=>': , ; |'
,p_help_text=>'Specify the separator character of the list items'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A2A0D0A202A20617070656E64546F4C6973740D0A202A0D0A202A204465736372697074696F6E3A20417070656E647320612076616C75652072657475726E65642062792061206469616C6F6720746F20616E206974656D20286F72206974656D7329';
wwv_flow_api.g_varchar2_table(2) := '200D0A202A20636F6E7461696E696E672061206C697374206F662076616C75657320736570617261746564206279206120636861726163746572202864656661756C743A203A290D0A202A0D0A202A20417574686F723A20446965676F20476572656E61';
wwv_flow_api.g_varchar2_table(3) := '2028536E69706572436174290D0A202A20576562536974653A2068747470733A2F2F736E69706572636174657870657269656E6365732E626C6F6773706F742E636F6D2F0D0A202A2056657273696F6E3A20312E302E300D0A202A204C6963656E73653A';
wwv_flow_api.g_varchar2_table(4) := '204D4954202868747470733A2F2F6F70656E736F757263652E6F72672F6C6963656E7365732F4D4954290D0A202A204C61737420557064617465643A20323032332D30372D32350D0A202A2F0D0A0D0A76617220617070656E64546F4C697374203D207B';
wwv_flow_api.g_varchar2_table(5) := '0D0A202020202F2F66756E6374696F6E207468617420676574732063616C6C65642066726F6D20706C7567696E0D0A20202020657865637574653A2066756E6374696F6E2829207B0D0A09092F2F20676574207468652076616C7565206F662074686520';
wwv_flow_api.g_varchar2_table(6) := '706172616D6D65746572730D0A09096C6574207265744974656D20203D20746869732E616374696F6E2E61747472696275746530313B202F2F52657475726E204974656D0D0A09096C6574207365704368617220203D20746869732E616374696F6E2E61';
wwv_flow_api.g_varchar2_table(7) := '747472696275746530323B202F2F536570617261746F72204368617261637465720D0A09096C6574206974656D734C69737420203D20746869732E616374696F6E2E6166666563746564456C656D656E74732E73706C697428272C27293B202F2F416666';
wwv_flow_api.g_varchar2_table(8) := '6563746564204974656D730D0A09090D0A09096C6574206E657776616C3B200D0A09092F2F47657420646174612066726F6D207661726961626C65730D0A09096C657420617070656E6456616C7565203D206576616C2827746869732E646174612E272B';
wwv_flow_api.g_varchar2_table(9) := '7265744974656D293B0D0A0D0A09092F2F49746572617465206F766572206166666563746564206974656D730D0A0909666F7220286C6574206974656D206F66206974656D734C69737429207B0D0A0909092F2F476574204974656D2056616C75650D0A';
wwv_flow_api.g_varchar2_table(10) := '0909096C657420737472696E674C697374203D202476286974656D293B0D0A0909090D0A0909092F2F496620746865206C69737420697320656D7074792C20736574207468652076616C75650D0A09090969662028737472696E674C6973742E6C656E67';
wwv_flow_api.g_varchar2_table(11) := '7468203D3D2030297B0D0A090909096E657776616C203D20617070656E6456616C75653B0D0A0909097D656C73657B0D0A090909092F2F20537472696E6720746F2061727261790D0A090909096C65742041727261794C697374203D20737472696E674C';
wwv_flow_api.g_varchar2_table(12) := '6973742E73706C69742873657043686172293B0D0A0D0A090909092F2F566572696679206966207468652076616C756520616C72656164792065786973747320746F2061766F6964206475706C69636174650D0A0909090976617220696E636C75796520';
wwv_flow_api.g_varchar2_table(13) := '3D2041727261794C6973742E696E636C7564657328617070656E6456616C7565293B0D0A0909090969662028202021696E636C7579652020297B0D0A090909090941727261794C6973742E7075736828617070656E6456616C7565293B0D0A090909097D';
wwv_flow_api.g_varchar2_table(14) := '0D0A09090909096E657776616C203D2041727261794C6973742E6A6F696E2873657043686172293B0D0A0909097D0D0A0909092F2F53657420746865206E65772076616C756520746F20746865206974656D0D0A0909092473286974656D2C6E65777661';
wwv_flow_api.g_varchar2_table(15) := '6C293B0D0A09097D0D0A097D0D0A7D3B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(63706141083066189)
,p_plugin_id=>wwv_flow_api.id(63702359166525197)
,p_file_name=>'appendToList.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
