import { useQuery } from 'react-query';
import { INotificationTemplate } from '@notifire/shared';
import { getNotificationsList } from '../notifications';

export function useTemplates() {
  const { data, isLoading } = useQuery<INotificationTemplate[]>('notificationsList', getNotificationsList);

  return {
    templates: data,
    loading: isLoading,
  };
}
