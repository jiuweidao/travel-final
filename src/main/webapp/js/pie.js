

document.write(" <script src=\"https://gw.alipayobjects.com/os/antv/assets/data-set/0.8.7/data-set.min.js\"></script>"); 
document.write(" <script src=\"https://gw.alipayobjects.com/os/antv/assets/g2/3.0.12/g2.min.js\"></script>"); 
'use strict';

var _DataSet = DataSet,
    DataView = _DataSet.DataView;

var data = [{ item: '事例一', count: 40 }, { item: '事例二', count: 21 }, { item: '事例三', count: 17 }, { item: '事例四', count: 13 }, { item: '事例五', count: 9 }];
var dv = new DataView();
dv.source(data).transform({
  type: 'percent',
  field: 'count',
  dimension: 'item',
  as: 'percent'
});
var chart = new G2.Chart({
  container: 'mountNode',
  forceFit: true,
  height: window.innerHeight
});
chart.source(dv, {
  percent: {
    formatter: function formatter(val) {
      val = val * 100 + '%';
      return val;
    }
  }
});
chart.coord('theta', {
  radius: 0.75
});
chart.tooltip({
  showTitle: false,
  itemTpl: '<li><span style="background-color:{color};" class="g2-tooltip-marker"></span>{name}: {value}</li>'
});
chart.intervalStack().position('percent').color('item').label('percent', {
  formatter: function formatter(val, item) {
    return item.point.item + ': ' + val;
  }
}).tooltip('item*percent', function (item, percent) {
  percent = percent * 100 + '%';
  return {
    name: item,
    value: percent
  };
}).style({
  lineWidth: 1,
  stroke: '#fff'
});
chart.render();