'use strict';
  $(document).ready(function() {
    $('#light-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'light'
    });
    $('#dark-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'dark'
    });
    $('#primary-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'primary'
    });
    $('#success-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'success'
    });
    $('#info-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'info'
    });
      $('#info-toolbar1').toolbar({
          content: '#toolbar-options1',
          style: 'info'
      });
      $('#info-toolbar2').toolbar({
          content: '#toolbar-options2',
          style: 'info'
      });
      $('#info-toolbar3').toolbar({
          content: '#toolbar-options3',
          style: 'info'
      });
      $('#info-toolbar4').toolbar({
          content: '#toolbar-options4',
          style: 'info'
      });
      $('#info-toolbar5').toolbar({
          content: '#toolbar-options5',
          style: 'info'
      });
      $('#info-toolbar6').toolbar({
          content: '#toolbar-options6',
          style: 'info'
      });
      $('#info-toolbar7').toolbar({
          content: '#toolbar-options7',
          style: 'info'
      });
    $('#warning-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'warning'
    });
    $('#danger-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'danger'
    });

    $('#top-toolbar').toolbar({
        content: '#toolbar-options',
        position: 'top',
        style: 'primary'
    });
    $('#left-toolbar').toolbar({
        content: '#toolbar-options',
        position: 'left',
        style: 'success'
    });
    $('#bottom-toolbar').toolbar({
        content: '#toolbar-options',
        position: 'bottom',
        style: 'info'
    });
    $('#right-toolbar').toolbar({
        content: '#toolbar-options',
        position: 'right',
        style: 'warning'
    });
    $('#click-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'danger',
        event: 'click'
    });

    $('#standard-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'primary',
        animation: 'standard',
    });

    $('#flip-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'success',
        animation: 'flip',
    });
    $('#grow-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'info',
        animation: 'grow',
    });

    $('#flyin-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'warning',
        animation: 'flyin',
    });

    $('#bounce-toolbar').toolbar({
        content: '#toolbar-options',
        style: 'danger',
        animation: 'bounce',
    });
});

