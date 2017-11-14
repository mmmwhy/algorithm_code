{$load=$point_node->getNodeLoad()}

<div id="load{$id}_chart" style="height: 300px; width: 100%;"></div>
	<div id="up{$id}_chart" style="height: 300px; width: 100%;"></div>
	<div id="alive{$id}_chart" style="height: 300px; width: 100%;"></div>
	<div id="speedtest{$id}_chart" style="height: 300px; width: 100%;"></div>
	<div id="speedtest{$id}_ping_chart" style="height: 300px; width: 100%;"></div>

				
	<script type="text/javascript">
		$().ready(function(){
			chart{$id} = new CanvasJS.Chart("load{$id}_chart",
			{
				title:{
					text: "Server load {$prefix}"
				},
				data: [
				{
					type: "line", 
					dataPoints: [
						{$i=0}
						{foreach $load as $single_load}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_load->log_time*1000}), y:{$single_load->getNodeLoad()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_load->log_time*1000}), y:{$single_load->getNodeLoad()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				}
				]
			});
			
			
			
			up_chart{$id} = new CanvasJS.Chart("up{$id}_chart",
			{
				title:{
					text: "Server uptime during the last 24 hours for {$prefix} - Online for {$point_node->getNodeUptime()}"
				},
				data: [
					{
						//startAngle: 45,
						indexLabelFontSize: 20,
						indexLabelFontFamily: "Garamond",
						indexLabelFontColor: "darkgrey",
						indexLabelLineColor: "darkgrey",
						indexLabelPlacement: "outside",
						type: "doughnut",
						showInLegend: true,
						dataPoints: [
							{
								y: {$point_node->getNodeUpRate()*100}, legendText:"Online rate {number_format($point_node->getNodeUpRate()*100,2)}%", indexLabel: "Online rate {number_format($point_node->getNodeUpRate()*100,2)}%"
							},
							{
								y: {(1-$point_node->getNodeUpRate())*100}, legendText:"Offline rate {number_format((1-$point_node->getNodeUpRate())*100,2)}%", indexLabel: "Offline rate {number_format((1-$point_node->getNodeUpRate())*100,2)}%"
							}
						]
					}
					]
			});
			
			{$load=$point_node->getNodeAlive()}
			alive_chart{$id} = new CanvasJS.Chart("alive{$id}_chart",
			{
				title:{
					text: "Number of connected users during the last 24 hours for {$prefix}"
				},
				data: [
				{
					type: "line", 
					dataPoints: [
						{$i=0}
						{foreach $load as $single_load}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_load->log_time*1000}), y:{$single_load->online_user}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_load->log_time*1000}), y:{$single_load->online_user}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				}
				]
			});
			
			
			
			{$speedtests=$point_node->getSpeedtestResult()}
			speedtest_chart{$id} = new CanvasJS.Chart("speedtest{$id}_chart",
			{
				title:{
					text: "Ping from major ISPs {$prefix}"
				},
				axisY: {				
					suffix: " ms"
				},
				data: [
				{
					type: "line", 
					showInLegend: true,
					legendText: "China Telecom ping",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getTelecomPing()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getTelecomPing()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText: "China Unicom ping",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getUnicomPing()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getUnicomPing()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText:"China Mobile ping",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getCmccPing()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getCmccPing()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				}
				]
			});
			
			speedtest_ping_chart{$id} = new CanvasJS.Chart("speedtest{$id}_ping_chart",
			{
				title:{
					text: "Connection ​​Speed {$prefix}"
				},
				axisY: {				
					suffix: " Mbps"
				},
				data: [
				{
					type: "line", 
					showInLegend: true,
					legendText: "China Telecom download speed",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getTelecomUpload()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getTelecomUpload()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText: "China Telecom upload speed",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getTelecomDownload()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getTelecomDownload()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText: "China Unicom download speed",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getUnicomUpload()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getUnicomUpload()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText: "China Unicom upload speed",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getUnicomDownload()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getUnicomDownload()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText:"China Mobile upload speed",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getCmccDownload()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getCmccDownload()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				},
				{
					type: "line", 
					showInLegend: true,
					legendText:"China Mobile download speed",
					dataPoints: [
						{$i=0}
						{foreach $speedtests as $single_speedtest}
							{if $i==0}
								{literal}
								{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getCmccUpload()}
								{literal}
								}
								{/literal}
								{$i=1}
							{else}
								{literal}
								,{
								{/literal}
									x: new Date({$single_speedtest->datetime*1000}), y:{$single_speedtest->getCmccUpload()}
								{literal}
								}
								{/literal}
							{/if}
						{/foreach}
						
					]
				}
				]
			});
			
			
			
			
			
			
			
				
			chart{$id}.render();
			up_chart{$id}.render();
			alive_chart{$id}.render();
			speedtest_chart{$id}.render();
			speedtest_ping_chart{$id}.render();
			
			
		});
		
		
		
		
			
	</script>
