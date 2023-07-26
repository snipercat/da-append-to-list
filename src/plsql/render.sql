FUNCTION render(p_dynamic_action IN apex_plugin.t_dynamic_action,
                p_plugin         IN apex_plugin.t_plugin)
    RETURN apex_plugin.t_dynamic_action_render_result 
IS
  l_result       apex_plugin.t_dynamic_action_render_result;
BEGIN
  l_result.attribute_01 := p_dynamic_action.attribute_01; --ReturnItem
  l_result.attribute_02 := p_dynamic_action.attribute_02; --Separator
  l_result.javascript_function := 'appendToList.execute';

  RETURN l_result;

END render;