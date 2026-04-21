import { useEffect, useState } from 'react';
import './toast.css';

function ToastNotification({ message, type, onClose }) {
  const [isExiting, setIsExiting] = useState(false);

  // Таймер автоматического закрытия
  useEffect(() => {
    const autoCloseTimer = setTimeout(() => {
      setIsExiting(true);
    }, 3000);

    return () => clearTimeout(autoCloseTimer);
  }, []);


  useEffect(() => {
    if (!isExiting) return;
    
    const timer = setTimeout(() => {
      onClose();
    }, 300);
    
    return () => clearTimeout(timer);
  }, [isExiting, onClose]);

  const handleClose = () => {
    setIsExiting(true);
  };

  const getIcon = () => {
    switch(type) {
      case 'success': return '✓';
      case 'error': return '✕';
      case 'warning': return '⚠';
      case 'info': return 'ℹ';
      default: return '';
    }
  };

  return (
    <div className={`toast ${type} ${isExiting ? 'exit' : ''}`}>
      <div className="toast-content">
        <span className="toast-icon">{getIcon()}</span>
        <p className="toast-message">{message}</p>
      </div>
      <button 
        onClick={handleClose} 
        className="toast-close"
        aria-label="Закрыть уведомление"
      >
         ×
      </button>
    </div>
  );
}

export default ToastNotification;
