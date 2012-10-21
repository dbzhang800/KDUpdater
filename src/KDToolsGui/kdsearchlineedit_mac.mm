#include <Cocoa/Cocoa.h>

#include <QCoreApplication>
#include <QDynamicPropertyChangeEvent>
#include <QKeyEvent>
#include <QMacCocoaViewContainer>
#include <QMenu>
#include <QMetaObject>
#include <QVariant>

#include <QDebug>
#include "kdcocoautils.h"

class SearchLineEditViewContainer : public QMacCocoaViewContainer
{
public:
    SearchLineEditViewContainer( void* widget, QWidget* parent = 0 )
        : QMacCocoaViewContainer( widget, parent )
    {
        setAttribute( Qt::WA_NativeWindow );
        setFocusPolicy( Qt::StrongFocus );
    }

    QSize sizeHint() const
    {
        return QSize( 23, 23 );
    }

    bool event( QEvent* event )
    {
        if( event->type() == QEvent::DynamicPropertyChange )
        {
            NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
            NSSearchField* search = static_cast< NSSearchField* >( cocoaView() );
            const QDynamicPropertyChangeEvent* const ev = static_cast< QDynamicPropertyChangeEvent* >( event );
            if( ev->propertyName() == "defaultText" )
            {
                [[search cell] setPlaceholderString: KDCocoaUtils::fromQString( property( "defaultText" ).toString() ) ];
            }
            else if( ev->propertyName() == "text" )
            {
                [[search cell] setStringValue: KDCocoaUtils::fromQString( property( "text" ).toString() )];
            }
            else if( ev->propertyName() == "menu" )
            {
                QMenu* const menu = dynamic_cast< QMenu* >( qVariantValue< QObject* >( property( "menu" ) ) );
                [[search cell] setSearchMenuTemplate: menu->macMenu( 0 ) ];
            }
            [pool drain];
        }
        return QMacCocoaViewContainer::event( event );
    }

    void textChanged()
    {
        NSSearchField* search = static_cast< NSSearchField* >( cocoaView() );
        parent()->setProperty( "text", KDCocoaUtils::toQString( [search stringValue] ) );
    }
};

@interface NSSearchFieldDelegate: NSObject
{
@public
    SearchLineEditViewContainer *target;
}
-(id)initWithObject:(SearchLineEditViewContainer*)object;
-(void)textDidChange:(NSNotification*)notification;
@end
@implementation NSSearchFieldDelegate
-(id)initWithObject:(SearchLineEditViewContainer*)object
{
    self = [super init];
    target = object;
    return self;
}
-(void)textDidChange:(NSNotification*)notification
{
    Q_UNUSED( notification )
    target->textChanged();
}
@end

@interface KDNSSearchField : NSSearchField
{
@public
    QWidget *container;
}
- (bool) textView: (NSTextView *)fieldEditor doCommandBySelector: (SEL) commandSelector;
@end
@implementation KDNSSearchField
- (void) mouseDown: (NSEvent *)theEvent
{
    container->setFocus(Qt::MouseFocusReason);
    [super mouseDown:theEvent];
}
- (bool) textView: (NSTextView *)fieldEditor doCommandBySelector: (SEL) commandSelector
{
    Q_UNUSED(fieldEditor);
    if (commandSelector == @selector(insertBacktab:))
    {
       QKeyEvent e( QEvent::KeyPress, Qt::Key_Backtab, Qt::NoModifier );
       return QCoreApplication::sendEvent( container, &e ) ? YES : NO;
    }
    else if (commandSelector == @selector(insertTab:))
    {
       QKeyEvent e( QEvent::KeyPress, Qt::Key_Tab, Qt::NoModifier );
       return QCoreApplication::sendEvent( container, &e ) ? YES : NO;
    }
    
    return NO;
}
@end

QMacCocoaViewContainer* createNSSearchField( QWidget* parent )
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    Q_UNUSED( pool )

    SearchLineEditViewContainer* const container = new SearchLineEditViewContainer( 0, parent );

    KDNSSearchField* search = [[KDNSSearchField alloc] init];
    container->setCocoaView( search );
    search->container = container;

    NSSearchFieldDelegate* delegate = [[NSSearchFieldDelegate alloc] init];
    delegate->target = container;


    [[NSNotificationCenter defaultCenter] addObserver:delegate selector:@selector(textDidChange:) name:NSControlTextDidChangeNotification object:search];

    return container;
}
