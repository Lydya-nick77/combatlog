
addon.name      = 'combatlog';
addon.author    = 'Lydya (from the work of Byrth and Spiken)';
addon.version   = '0.3.0';
addon.desc      = 'Combat log Parser based on Simplelog';
addon.link      = '';

require('common');
require('lib\\constants');
chat				= require('chat');
UTF8toSJIS			= require('lib\\shift_jis')

res_actmsg			= require('lib\\res\\action_messages')
res_igramm			= require('lib\\res\\items_grammar')
res_skills			= require('lib\\res\\skills')

gDefaultSettings    = require('configuration');
gStatus				= require('lib\\profilehandler');
gFuncs				= require('lib\\functions');
gFileTools			= require('lib\\filetools');
gCommandHandlers	= require('lib\\commandhandlers');
gTextHandlers		= require('lib\\texthandlers');
gPacketHandlers		= require('lib\\packethandlers');
gActionHandlers		= require('lib\\actionhandlers');
gConfig				= require('lib\\ui');

gProfileSettings	= static_settings;
gProfileFilter		= static_filters;
gProfileColor		= static_colors;


ashita.events.register('load', 'load_cb', function ()
	gStatus.Init();
end);

ashita.events.register('text_in', 'text_in_cb', function (e)
	gTextHandlers.HandleIncomingText(e);
end);

ashita.events.register('packet_in', 'packet_in_cb', function (e)
	gPacketHandlers.HandleIncomingPacket(e);
end);

ashita.events.register('packet_out', 'packet_out_cb', function (e)
	gPacketHandlers.HandleOutgoingPacket(e);
end);

ashita.events.register('command', 'command_cb', function (e)
	gCommandHandlers.HandleCommand(e);
end);

ashita.events.register('d3d_present', 'd3d_present_callback1', function ()
	gConfig.render_config(gConfig.state.toggle_menu)
	gConfig.render_combat_log()

	gConfig.toggle_menu(0)
end);
